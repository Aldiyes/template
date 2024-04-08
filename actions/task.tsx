// import { db } from '@/lib/db';
// import { TaskSchema } from '@/schemas';
// import { User } from 'lucide-react';
// import * as z from 'zod';

// export const addTask = async (values: z.infer<typeof TaskSchema>) => {
// 	const user = awiat db.user.findUnique({
// 		where: {
// 			id: 
// 		}
// 	})
// 	const validatedFields = TaskSchema.safeParse(values);

// 	if (!validatedFields.success) {
// 		return { error: 'Invalid fields!' };
// 	}

// 	const { title, planned } = validatedFields.data;

// 	if (planned) {
// 		await db.task.create({
// 			data: {
// 				userId: userId
// 			}
// 		})
// 	}
// };
