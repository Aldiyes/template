import { db } from '@/lib/db';
import { NextResponse } from 'next/server';

export async function GET() {
	try {
		const task = await db.task.findMany();
		if (!task) {
			return NextResponse.json('No Data Found!', { status: 404 });
		}
		return NextResponse.json(task, { status: 200 });
	} catch (error) {
		console.log('[GET: API/TASK] - ', error);
		return NextResponse.json('Internal Server Error!', { status: 500 });
	}
}

export async function POST(req: Request) {
	const { userId, title } = await req.json();
	if (!title) {
		return NextResponse.json('No Values', { status: 404 });
	}
	try {
		const createTask = await db.task.create({
			data: {
				userId,
				title,
			},
		});

		return NextResponse.json(createTask, { status: 200 });
	} catch (error) {
		console.log('[POST: API/TASK] -', error);
		return new NextResponse('Internal Server Error', { status: 500 });
	}
}
