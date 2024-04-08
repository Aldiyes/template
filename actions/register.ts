'use server';

import { hashSync } from 'bcryptjs';
import * as z from 'zod';

import { getUserByEmail } from '@/data/user';
import { RegisterSchema } from '@/schemas';

import { db } from '@/lib/db';
import { sendVerificationEmail } from '@/lib/mail';
import { generateVerificationToken } from '@/lib/tokens';

export const register = async (values: z.infer<typeof RegisterSchema>) => {
	const validatedFields = RegisterSchema.safeParse(values);

	if (!validatedFields.success) {
		return { error: 'Invalid fields!' };
	}

	const { email, password, name } = validatedFields.data;

	const hashedPassword = await hashSync(password, 12);

	const existingUser = await getUserByEmail(email);

	if (existingUser) {
		return { error: 'Email already in use!' };
	}

	await db.user.create({
		data: {
			name,
			email,
			password: hashedPassword,
		},
	});

	//TODO: send verification token email
	const verificationToken = await generateVerificationToken(email);
	await sendVerificationEmail(verificationToken.email, verificationToken.token);

	return { success: 'Confirmation email sent!' };
};
