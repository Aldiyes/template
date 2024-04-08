import { getAllTask } from '@/actions/task';
import { TaskLists } from '@/components/task/task-lists';

export type AllTaskProps = {
	id: string;
	title: string;
	userId: string;
	completed: boolean;
}[];

export default async function AllTaskPage() {
	const taskList = await getAllTask();
	return (
		<main className="m-6 flex flex-col gap-y-4">
			<section>
				{taskList?.length !== 0 ? (
					<TaskLists data={taskList} />
				) : (
					<h1>You don't have any tasks</h1>
				)}
			</section>
		</main>
	);
}
