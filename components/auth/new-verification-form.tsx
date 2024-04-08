'use client';

import { useSearchParams } from 'next/navigation';
import { useCallback, useEffect, useState } from 'react';
import { BeatLoader } from 'react-spinners';

import { newVerification } from '@/actions/new-verification';

import { CardWraper } from '@/components/auth/card-wraper';
import { FormError } from '@/components/form-error';
import { FormSuccess } from '@/components/form-success';

export const NewVerificationForm = () => {
	const [error, setError] = useState<string | undefined>('');
	const [success, setSuccess] = useState<string | undefined>('');
	const searchParams = useSearchParams();

	const token = searchParams.get('token');

	const onSubmit = useCallback(() => {
		if (success || error) {
			return;
		}

		if (!token) {
			setError('Missing token');
			return;
		}
		newVerification(token)
			.then((data) => {
				setSuccess(data.success);
				setError(data.error);
			})
			.catch(() => {
				setError('Something went wrong!');
			});
	}, [token, success, error]);

	useEffect(() => {
		onSubmit();
	}, [onSubmit]);

	return (
		<CardWraper
			headerLabel="Confirming your verification"
			backButtonLabel="Back to login"
			backButtonHref="/auth/login"
		>
			<div className="w-full flex items-center justify-center">
				{!success && !error && <BeatLoader />}
				<FormSuccess message={success} />
				{!success && <FormError message={error} />}
			</div>
		</CardWraper>
	);
};