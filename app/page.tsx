import { EmployeeDirectory } from '@/components/features/EmployeeDirectory'

export default async function Home() {
  return (
    <div className="h-full flex flex-col p-6 md:p-8">
      <div className="w-full max-w-7xl mx-auto flex flex-col h-full">
        <EmployeeDirectory />
      </div>
    </div>
  )
}
