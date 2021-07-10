@extends('layouts.app')

@section('title')
    User Transactions
@endsection

@section('content')
    <div class="page-content page-home">
        <section class="store-trend-categories">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12" data-aos="fade-up">
                        <h5 class="mb-3">Recent Transactions</h5>
                    </div>
                </div>
            </div>
        </section>

        <section>
            <div class="section-content section-dashboard-home" data-aos="fade-up">
                <div class="container-fluid">
                    <div class="dashboard-content">
                        <div class="row mt-3">
                            <div class="col-12 mt-2">
                                @foreach ($transactions as $transaction)
                                    <a class="card card-list d-block"
                                        href="{{ route('dashboard-transaction-details', $transaction->id) }}">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-1">

                                                </div>
                                                <div class="col-md-3">
                                                    {{ $transaction->code ?? '' }}
                                                </div>

                                                <div class="col-md-3">
                                                    {{ $transaction->transaction_status ?? '' }}
                                                </div>

                                                <div class="col-md-3">
                                                    {{ $transaction->created_at ?? '' }}
                                                </div>
                                                <div class="col-md-1 d-none d-md-block">
                                                    <img src="/images/dashboard-arrow-right.svg" alt="" />
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
