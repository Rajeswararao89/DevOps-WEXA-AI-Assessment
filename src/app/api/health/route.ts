import { NextResponse } from 'next/server';

export async function GET() {
  const payload = {
    status: 'ok',
    build: process.env.NEXT_PUBLIC_BUILD_SHA || 'local',
    timestamp: new Date().toISOString()
  };
  return NextResponse.json(payload);
}
