<x-app-layout>

    <br />
    
    <div class="container">
        <div class="text-center" style="margin-bottom:2%">
            <h1 class="text-4xl">MANAGE PAYMENT</h1>
            <h4 class="text-2xl">Payment List</h4>
        </div>
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
            <table class="w-full border-collapse bg-white text-left text-sm text-gray-500">
                <thead class="bg-gray-50">
                    <form method="GET" action="{{ route('payments.index') }}" class="mb-4">
                        <div class="flex justify-center">
                            <div class="rounded-lg overflow-hidden bg-gray-100 shadow-md p-4" style="width: 300px;">
                                <label for="sort" class="block text-sm font-medium text-gray-700 mb-2">Sort By:</label>
                                <select name="sort" id="sort" class="form-select">
                                    <option value="" disabled selected>Select</option>
                                    <option value="successful" {{ request('sort') == 'successful' ? 'selected' : '' }}>SUCCESSFUL</option>
                                    <option value="unsuccessful" {{ request('sort') == 'unsuccessful' ? 'selected' : '' }}>UNSUCCESSFUL</option>
                                </select>
                            </div>
                        </div>
                    </form>

                    <tr>
                        <th class="px-6 py-4 font-medium text-gray-900">No.</th>
                        <th scope="col" class="px-6 py-4 font-medium text-gray-900">KIOSK ID</th>
                        <th scope="col" class="px-6 py-4 font-medium text-gray-900">Payment ID</th>
                        <th scope="col" class="px-6 py-4 font-medium text-gray-900">Date</th>
                        <th scope="col" class="px-6 py-4 font-medium text-gray-900">Total Fee</th>
                        <th scope="col" class="px-6 py-4 font-medium text-gray-900">Payment Method</th>
                        <th scope="col" class="px-6 py-4 font-medium text-gray-900 text-center">Remark</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100 border-t border-gray-100">
                    @php
                        $no = 1;
                        $paym = $payments->where('PaymentType', $type);
        
                        if (request('sort') == 'successful') {
                            $paym = $paym->where('remark', 'Successful');
                        } elseif (request('sort') == 'unsuccessful') {
                            $paym = $paym->where('remark', 'Unsuccessful');
                        }
                    @endphp

                    @if ($paym)
                        @foreach ($paym as $payment)
                            <tr class="hover:bg-gray-50">
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
                                        <span
                                            class="inline-flex items-center gap-1 rounded-full bg-blue-50 px-2 py-1 text-xs font-semibold text-blue-600">
                                            {{ 'RM ' . number_format((float) $payment->Total_Price, 2) }}
                                        </span>
                                    </div>
                                </td>
                                <td class="px-6 py-4">{{ $payment->paymentOpt }}</td>
                                <td class="px-6 py-4">
                                    <div class="flex justify-end gap-4">
                                        @if($payment->remark == 'Rejected')
                                            <div class="px-6 py-4 text-red-600 font-bold" style="margin-right: 40px;"> <!-- Adjusted margin -->
                                                {{ __('REJECTED') }}
                                        @elseif($payment->remark == 'Approved')
                                            <div class="px-6 py-4 text-green-600 font-bold" style="margin-right: 120px">
                                                {{ __('APPROVED') }}</div>
                                        @elseif($payment->remark == 'Unsuccessful')
                                            <div class="px-6 py-4 text-red-600 font-bold" style="margin-right: 97px">
                                                {{ __('UNSUCCESSFUL') }}</div>
                                        @elseif($payment->remark == 'Successful')
                                            <div class="px-6 py-4 text-green-600 font-bold" style="margin-right: 109px">
                                                {{ __('SUCCESSFUL') }}</div>
                                        @else
                                            <div class="flex justify-end gap-4" style="margin-right: 85px">
                                                <button x-data="{ tooltip: 'View' }" alt="View" data-bs-toggle="modal"
                                                        data-bs-target="#viewPayment{{ $payment->id }}"
                                                        id="{{ $payment->id }}">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="16"
                                                         width="18" viewBox="0 0 576 512" stroke-width="1.5"
                                                         stroke="currentColor" class="h-6 w-6" x-tooltip="tooltip">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              d="M288 80c-65.2 0-118.8 29.6-159.9 67.7C89.6 183.5 63 226 49.4 256c13.6 30 40.2 72.5 78.6 108.3C169.2 402.4 222.8 432 288 432s118.8-29.6 159.9-67.7C486.4 328.5 513 286 526.6 256c-13.6-30-40.2-72.5-78.6-108.3C406.8 109.6 353.2 80 288 80zM95.4 112.6C142.5 68.8 207.2 32 288 32s145.5 36.8 192.6 80.6c46.8 43.5 78.1 95.4 93 131.1c3.3 7.9 3.3 16.7 0 24.6c-14.9 35.7-46.2 87.7-93 131.1C433.5 443.2 368.8 480 288 480s-145.5-36.8-192.6-80.6C48.6 356 17.3 304 2.5 268.3c-3.3-7.9-3.3-16.7 0-24.6C17.3 208 48.6 156 95.4 112.6zM288 336c44.2 0 80-35.8 80-80s-35.8-80-80-80c-.7 0-1.3 0-2 0c1.3 5.1 2 10.5 2 16c0 35.3-28.7 64-64 64c-5.5 0-10.9-.7-16-2c0 .7 0 1.3 0 2c0 44.2 35.8 80 80 80zm0-208a128 128 0 1 1 0 256 128 128 0 1 1 0-256z" />
                                                    </svg>
                                                    <div class="flex justify-center" style="margin-right:20%;">
                                                        {{ __('VIEW') }}</div>
                                                </button>
                                                <button x-data="{ tooltip: 'Approve' }" alt="approve" data-bs-toggle="modal"
                                                        data-bs-target="#approvePayment{{ $payment->id }}"
                                                        id="{{ $payment->id }}">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="16"
                                                         width="18" viewBox="0 0 448 512" stroke-width="1.5"
                                                         stroke="currentColor" class="h-6 w-6" x-tooltip="tooltip">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3L182.6 406.6c-12.5 12.5-32.8 12.5-45.3 0L9.4 278.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7L393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z" />
                                                    </svg>
                                                    <div class="flex justify-center" style="margin-right:5%">
                                                        {{ __('APPROVE') }}</div>
                                                </button>
                                                <button x-data="{ tooltip: 'Reject' }" alt="reject" data-bs-toggle="modal"
                                                        data-bs-target="#rejectPayment{{ $payment->id }}"
                                                        id="{{ $payment->id }}">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="16"
                                                         width="18" viewBox="0 0 384 512" stroke-width="1.5"
                                                         stroke="currentColor" class="h-6 w-6" x-tooltip="tooltip">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              d="M310.6 361.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L192 333.3 118.6 406.6c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L146.7 288 73.4 214.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L192 242.7l73.4-73.4c12.5-12.5 32.8-12.5 45.3 0s12.5 32.8 0 45.3L237.3 288l73.4 73.4z" />
                                                    </svg>
                                                    <div class="flex justify-center" style="margin-right:10%">
                                                        {{ __('REJECT') }}</div>
                                                </button>
                                            </div>
                                        @endif
                                    </div>
                                </td>
                            </tr>
                            <!-- Include your modals for view, approve, and reject here -->
                        @endforeach
                    @else
                        <tr>
                            <td class="px-6 py-4 text-center" colspan="7">{{ __('No payments found.') }}</td>
                        </tr>
                    @endif
                </tbody>
            </table>
        </div>
    </div>

</x-app-layout>
