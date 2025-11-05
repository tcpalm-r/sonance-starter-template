import { createClient } from '@/lib/supabase/server'

export async function EmployeeDirectory() {
  const supabase = await createClient()

  // Fetch employees from Supabase
  const { data: employees, error } = await supabase
    .from('employees')
    .select('*')
    .order('id', { ascending: true })

  if (error) {
    console.error('Error fetching employees:', error)
  }

  return (
    <div className="h-full flex flex-col">
      <div className="flex-none mb-6">
        <h1 className="text-3xl md:text-4xl font-bold mb-2 text-white">Employee Directory</h1>
        <p className="text-gray-400">{employees?.length || 0} employees</p>
      </div>

      {error && (
        <div className="bg-red-900/20 border border-red-800 text-red-400 px-4 py-3 rounded-lg mb-4 flex-none">
          <p className="font-semibold">Error loading employees</p>
          <p className="text-sm">{error.message}</p>
        </div>
      )}

      {employees && employees.length > 0 ? (
        <div className="flex-1 bg-[#242424] border border-[#333333] rounded-lg shadow-xl flex flex-col min-h-0">
          <div className="flex-1 overflow-y-auto overflow-x-hidden">
            <table className="w-full table-fixed">
              <thead className="bg-[#2a2a2a] border-b border-[#333333] sticky top-0 z-10">
                <tr>
                  <th className="w-[30%] px-4 md:px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider">
                    Employee
                  </th>
                  <th className="w-[25%] px-4 md:px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider">
                    Position
                  </th>
                  <th className="w-[20%] px-4 md:px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider">
                    Department
                  </th>
                  <th className="w-[25%] px-4 md:px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider">
                    Email
                  </th>
                </tr>
              </thead>
              <tbody className="bg-[#242424] divide-y divide-[#333333]">
                {employees.map((employee: any) => (
                  <tr key={employee.id} className="hover:bg-[#2a2a2a] transition-colors">
                    <td className="px-4 md:px-6 py-4">
                      <div className="flex items-center min-w-0">
                        <div className="w-10 h-10 bg-[#3ECF8E]/20 rounded-full flex items-center justify-center mr-3 border border-[#3ECF8E]/30 flex-shrink-0">
                          <span className="text-sm font-bold text-[#3ECF8E]">
                            {employee.full_name?.charAt(0) ||
                              employee.name?.charAt(0) ||
                              employee.first_name?.charAt(0) ||
                              '?'}
                          </span>
                        </div>
                        <div className="text-sm font-medium text-white truncate min-w-0">
                          {employee.full_name ||
                            employee.name ||
                            `${employee.first_name || ''} ${employee.last_name || ''}`.trim() ||
                            'Unknown'}
                        </div>
                      </div>
                    </td>
                    <td className="px-4 md:px-6 py-4">
                      <div className="text-sm text-gray-300 truncate">
                        {employee.position || employee.title || '-'}
                      </div>
                    </td>
                    <td className="px-4 md:px-6 py-4">
                      <div className="text-sm text-gray-300 truncate">
                        {employee.department || '-'}
                      </div>
                    </td>
                    <td className="px-4 md:px-6 py-4">
                      {employee.email ? (
                        <a
                          href={`mailto:${employee.email}`}
                          className="text-sm text-[#3ECF8E] hover:underline truncate block"
                        >
                          {employee.email}
                        </a>
                      ) : (
                        <span className="text-sm text-gray-500">-</span>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      ) : (
        !error && (
          <div className="flex-1 flex items-center justify-center text-gray-400">
            <div className="text-center">
              <p>No employees found in the database.</p>
              <p className="text-sm mt-2 text-gray-500">
                Add some employees to your Supabase &apos;employees&apos; table to see them here.
              </p>
            </div>
          </div>
        )
      )}
    </div>
  )
}
