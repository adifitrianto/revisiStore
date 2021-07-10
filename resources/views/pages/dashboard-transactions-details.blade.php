@extends('layouts.dashboard')

@section('title')
    Store Dashboard Transaction Detail
@endsection

@section('content')
    <<div class="section-content section-dashboard-home" data-aos="fade-up">
        <div class="container-fluid">
            <div class="dashboard-heading">
                <h2 class="dashboard-title">#{{ $transaction->code }}</h2>
                <p class="dashboard-subtitle">
                    Transactions Details
                </p>
            </div>
            <div class="dashboard-content" id="transactionDetails">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 col-md-8">
                                        <div class="row">
                                            <div class="col-12 col-md-6">
                                                <div class="product-title">Customer Name</div>
                                                <div class="product-subtitle">{{ $transaction->user->name }}</div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="product-title">
                                                    Date of Transaction
                                                </div>
                                                <div class="product-subtitle">
                                                    {{ $transaction->created_at }}
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="product-title">Transaction Status</div>
                                                <div class="product-subtitle text-danger">
                                                    {{ $transaction->transaction_status }}
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="product-title"> Total Price </div>
                                                <div class="product-subtitle">
                                                    Rp.{{ number_format($transaction->total_price) }}
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="product-title">Mobile</div>
                                                <div class="product-subtitle">
                                                    {{ $transaction->user->phone_number }}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                @foreach ($transaction->details as $detail)
                                    <div class="row">

                                        <div class="col-12 col-md-4">
                                            <img src="{{ Storage::url($detail->product['galleries']->first()->photos ?? '') }}"
                                                class="w-100 mb-3" alt="" />
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <div class="product-title">Product Name</div>
                                            <div class="product-subtitle">
                                                {{ $detail->product['name'] }}
                                            </div>
                                        </div>
                                    </div>
                                @endforeach

                                <form action="{{ route('transaction.update', $transaction->id) }}" method="POST">
                                    @csrf
                                    <input name="_method" type="hidden" value="PUT">
                                    <div class="col-12 mt-4">
                                        <h5>Shipping Information</h5>
                                    </div>
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-12 col-md-6">
                                                <div class="product-title">Address I</div>
                                                <div class="product-subtitle">
                                                    {{ $transaction->user['address_one'] }}
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="product-title">Address II</div>
                                                <div class="product-subtitle">
                                                    {{ $transaction->user['address_two'] ?? 'N/A' }}
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="product-title">Province</div>
                                                <div class="product-subtitle">
                                                    {{ App\Models\Province::find($transaction->user->provinces_id)->name }}
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="product-title">City</div>
                                                <div class="product-subtitle">
                                                    {{ App\Models\Regency::find($transaction->user->regencies_id)->name }}
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="product-title">Postal Code</div>
                                                <div class="product-subtitle">{{ $transaction->user['zip_code'] }}</div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="product-title">Country</div>
                                                <div class="product-subtitle">{{ $transaction->user['country'] }}</div>
                                            </div>

                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>

        @if ($transaction->transaction_status === 'PENDING')
            <section>
                <div class="section-content section-dashboard-home">
                    <div class="container-fluid">
                        <div class="dashboard-heading">
                        </div>
                        <div class="dashboard-content">
                            <div class="row">
                                <div class="col-md-12">
                                    @if ($errors->any())
                                        <div class="alert alert-danger">
                                            <ul>
                                                @foreach ($errors->all() as $error)
                                                    <li>{{ $error }}</li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    @endif
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="dashboard-heading">
                                                <h2 class="dashboard-title">UPLOAD BUKTI TRANSAKSI</h2>
                                                <p class="dashboard-subtitle">
                                                </p>
                                            </div>
                                            <form action="{{ route('dashboard-transaction-update') }}" method="POST"
                                                enctype="multipart/form-data">
                                                @csrf

                                                <input name="transaction_id" type="hidden" value={{ $transaction->id }}>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label>Bukti</label>
                                                            <input type="file" name="photos" class="form-control" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col text-right">
                                                        <button type="submit" class="btn btn-success px-5">
                                                            Upload
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        @endif

    @endsection

    @push('addon-script')
        <script src="/vendor/vue/vue.js"></script>
        <script>
            var transactionDetails = new Vue({
                el: "#transactionDetails",
                data: {
                    status: "SHIPPING",
                    resi: "BDO12308012132",
                },
            });

        </script>
    @endpush
