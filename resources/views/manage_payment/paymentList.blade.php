<x-app-layout>

    <br />
    <div class="container">
        <div class="text-center" style="margin-bottom:2%">
            <h1 class="text-4xl">MANAGE PAYMENT</h1>
            <h4 class="text-2xl">Payment List</h4>
        </div>

        <!-- Add the dropdown menu -->
        <div class="mb-4">
            <label for="paymentFilter" class="font-medium">Filter by:</label>
            <select id="paymentFilter" class="ml-2 px-4 py-2 border border-gray-300 rounded-md" onchange="filterPayments()">
                <option value="all">All</option>
                <option value="rejected">Rejected</option>
                <option value="approved">Approved</option>
                <option value="unsuccessful">Unsuccessful</option>
                <option value="successful">Successful</option>
            </select>
        </div>
        <!-- End of dropdown menu -->

        @if (Session::has('Approve'))
            <div class="alert alert-success" role="alert">
                {{ Session::get('Approve') }}
            </div>
        @endif
        @if (Session::has('Reject'))
            <div class="alert alert-danger" role="alert">
                {{ Session::get('Reject') }}
            </div>
        @endif
        <br />

        <div class="overflow-hidden rounded-lg border border-gray-200 shadow-md m-5">
            <table id="paymentTable" class="w-full border-collapse bg-white text-left text-sm text-gray-500">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-4 font-medium text-gray-900">No.</th>
                        <th scope="col" class="px-6 py-4 font-medium text-gray-900">KIOSK ID</th>
                        <th scope="col" class="px-6 py-4 font-medium text-gray-900">Payment ID</th>
                        <th scope="col" class="px-6 py-4 font-medium text-gray-900">Date</th>
                        <th scope="col" class="px-6 py-4 font-medium text-gray-900">Total Fee</th>
                        <th scope="col" class="px-6 py-4 font-medium text-gray-900">Payment Method</th>
                        <th scope="col" class="px-6 py-4 font-medium text-gray-900">Status</th>
                        <th scope="col" class="px-6 py-4 font-medium text-gray-900"></th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100 border-t border-gray-100">
                    @php
                        $no = 1;
                    @endphp
                    @if ($paym = $payments->where('PaymentType', $type))
                        @foreach ($paym as $payment)
                            <tr class="hover:bg-gray-50 payment-row" data-status="{{ strtolower($payment->remark) }}">
                                <td class="px-6 py-4">{{ $no++ }}</td>
                                <th class="flex gap-3 px-6 py-4 font-normal text-gray-900">
                                    @php
                                        $uid = $payment->User_ID;
                                    @endphp
                                    <div class="text-sm">
                                        @if ($application = $applications->where('User_ID', $uid)->first())
                                            <div class="font-medium text-gray-700">{{ $application->Kiosk_ID }}</div>
                                        @endif
                                        <div class="text-gray-400">{{ $payment->User_ID }}</div>
                                    </div>
                                </th>
                                <td class="px-6 py-4">{{ $payment->Payment_ID }}</td>
                                <td class="px-6 py-4">{{ date('d/m/Y', strtotime($payment->PaymentDate)) }}</td>
                                <td class="px-6 py-4">
                                    <div class="flex gap-2">
                                        <span class="inline-flex items-center gap-1 rounded-full bg-blue-50 px-2 py-1 text-xs font-semibold text-blue-600">
                                            {{ 'RM ' . number_format((float) $payment->Total_Price, 2) }}
                                        </span>
                                    </div>
                                </td>
                                <td class="px-6 py-4">{{ $payment->paymentOpt }}</td>
                                <td class="px-6 py-4">
                                    @if($payment->remark == 'Rejected')
                                        <div class="px-6 py-4 text-red-600 font-bold" style="margin-right: 120px">
                                            {{ __('REJECTED') }}
                                        </div>
                                    @elseif($payment->remark == 'Approved')
                                        <div class="px-6 py-4 text-green-600 font-bold" style="margin-right: 120px">
                                            {{ __('APPROVED') }}
                                        </div>
                                    @elseif($payment->remark == 'Unsuccessful')
                                        <div class="px-6 py-4 text-red-600 font-bold" style="margin-right: 97px">
                                            {{ __('UNSUCCESSFUL') }}
                                        </div>
                                    @elseif($payment->remark == 'Successful')
                                        <div class="px-6 py-4 text-green-600 font-bold" style="margin-right: 109px">
                                            {{ __('SUCCESSFUL') }}
                                        </div>
                                    @endif
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex justify-end gap-4">
                                        @if(!in_array($payment->remark, ['Rejected', 'Approved', 'Unsuccessful', 'Successful']))
                                            <button x-data="{ tooltip: 'View' }" alt="View" data-bs-toggle="modal" data-bs-target="#viewPayment{{ $payment->id }}" id="{{ $payment->id }}">
                                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="18" viewBox="0 0 576 512" stroke-width="1.5" stroke="currentColor" class="h-6 w-6" x-tooltip="tooltip">
                                                    <path stroke-linecap="round" stroke-linejoin="round" d="M288 80c-65.2 0-118.8 29.6-159.9 67.7C89.6 183.5 63 226 49.4 256c13.6 30 40.2 72.5 78.6 108.3C169.2 402.4 222.8 432 288 432s118.8-29.6 159.9-67.7C486.4 328.5 513 286 526.6 256c-13.6-30-40.2-72.5-78.6-108.3C406.8 109.6 353.2 80 288 80zM95.4 112.6C142.5 68.8 207.2 32 288 32s145.5 36.8 192.6 80.6c46.8 43.5 78.1 95.4 93 131.1c3.3 7.9 3.3 16.7 0 24.6c-14.9 35.7-46.2 87.7-93 131.1C433.5 443.2 368.8 480 288 480s-145.5-36.8-192.6-80.6C48.6 356 17.3 304 2.5 268.3c-3.3-7.9-3.3-16.7 0-24.6C17.3 208 48.6 156 95.4 112.6zM288 336c44.2 0 80-35.8 80-80s-35.8-80-80-80c-.7 0-1.3 0-2 0c1.3 5.1 2 10.5 2 16c0 35.3-28.7 64-64 64c-5.5 0-10.9-.7-16-2c0 .7 0 1.3 0 2c0 44.2 35.8 80 80 80zm0-208a128 128 0 1 1 0 256 128 128 0 1 1 0-256z" />
                                                </svg>
                                                <div class="flex justify-center" style="margin-right:20%;">{{ __('VIEW') }}</div>
                                            </button>
                                            <button x-data="{ tooltip: 'Approve' }" alt="approve" data-bs-toggle="modal" data-bs-target="#approvePayment{{ $payment->id }}" id="{{ $payment->id }}">
                                                <svg style="color: #007FFF; margin-left: 17px" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                                    <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 6h11.25m0 0v11.25m0-11.25L5.625 22.875l-5.625-5.625L16.125 6z" />
                                                </svg>
                                                <div class="flex justify-center" style="margin-right:17%;">{{ __('APPROVE') }}</div>
                                            </button>
                                            <button x-data="{ tooltip: 'Reject' }" alt="reject" data-bs-toggle="modal" data-bs-target="#rejectPayment{{ $payment->id }}" id="{{ $payment->id }}">
                                                <svg style="color: red; margin-left: 17px" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                                    <path stroke-linecap="round" stroke-linejoin="round" d="M18.364 5.636l-12.728 12.728m12.728 0L5.636 5.636" />
                                                </svg>
                                                <div class="flex justify-center" style="margin-right:20%;">{{ __('REJECT') }}</div>
                                            </button>
                                        @endif
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    @endif
                </tbody>
            </table>
        </div>
    </div>

    <!-- JavaScript to filter table rows based on dropdown selection -->
    <script>
        function filterPayments() {
            const filter = document.getElementById('paymentFilter').value;
            const rows = document.querySelectorAll('#paymentTable tbody tr');

            rows.forEach(row => {
                if (filter === 'all' || row.getAttribute('data-status') === filter) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>

</x-app-layout>