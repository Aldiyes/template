import { TaskLists } from '@/components/task/task-lists';

export default function MyDayPage() {
	return (
		<main className="m-6 flex flex-col gap-y-4">
			<section>
				<TaskLists />
			</section>
		</main>
	);
}
