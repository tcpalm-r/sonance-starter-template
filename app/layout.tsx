import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'
import { Sidebar } from '@/components/layout/Sidebar'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'Ari and Jorge Starter',
  description: 'Next.js 14 starter project with Supabase',
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className="dark">
      <body className={`${inter.className} bg-[#1c1c1c] text-gray-100`}>
        <div className="flex h-screen">
          <Sidebar />
          <main className="flex-1 ml-[200px] overflow-auto">{children}</main>
        </div>
      </body>
    </html>
  )
}
