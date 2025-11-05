'use client'

import { useState } from 'react'
import Link from 'next/link'
import { usePathname } from 'next/navigation'

interface SidebarTab {
  id: string
  label: string
  icon: string
  href: string
}

const tabs: SidebarTab[] = [
  {
    id: 'employee-directory',
    label: 'Employee Directory',
    icon: '👥',
    href: '/',
  },
  // More tabs can be added here in the future
]

export function Sidebar() {
  const pathname = usePathname()

  return (
    <aside className="w-[200px] h-screen bg-[#0f0f0f] border-r border-[#2a2a2a] fixed left-0 top-0 flex flex-col">
      {/* Logo/Header */}
      <div className="h-16 border-b border-[#2a2a2a] flex items-center px-4">
        <h1 className="text-lg font-semibold text-white">Dashboard</h1>
      </div>

      {/* Navigation Tabs */}
      <nav className="flex-1 py-4">
        <ul className="space-y-1 px-2">
          {tabs.map(tab => {
            const isActive = pathname === tab.href
            return (
              <li key={tab.id}>
                <Link
                  href={tab.href}
                  className={`
                    flex items-center gap-3 px-3 py-2.5 rounded-lg
                    transition-colors duration-150
                    ${
                      isActive
                        ? 'bg-[#3ECF8E]/10 text-[#3ECF8E]'
                        : 'text-gray-400 hover:text-white hover:bg-[#2a2a2a]'
                    }
                  `}
                >
                  <span className="text-xl">{tab.icon}</span>
                  <span className="text-sm font-medium">{tab.label}</span>
                </Link>
              </li>
            )
          })}
        </ul>
      </nav>

      {/* Footer (optional - can be used for user profile, settings, etc.) */}
      <div className="h-16 border-t border-[#2a2a2a] flex items-center px-4">
        <p className="text-xs text-gray-500">v1.0.0</p>
      </div>
    </aside>
  )
}
