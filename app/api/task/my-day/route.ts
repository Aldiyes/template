import { db } from '@/lib/db';
import { NextResponse } from 'next/server';

export async function GET() {
	try {
		const myDay = await db.myDay.findMany();
		if (!myDay) {
			return NextResponse.json('No Data Found!', { status: 404 });
		}
		return NextResponse.json(myDay, { status: 200 });
	} catch (error) {
		console.log('[GET: API/TASK/MY-DAY] - ', error);
		return NextResponse.json('Internal Server Error!', { status: 500 });
	}
}

export async function POST(req: Request) {
	const values = await req.json();
	try {
		const createMyDay = await db.myDay.create({
			data: {
				...values,
			},
		});

		return NextResponse.json(createMyDay, { status: 200 });
	} catch (error) {
		console.log('[POST: API/TASK/MY-DAY]', error);
		return new NextResponse('Internal Server Error', { status: 500 });
	}
}
