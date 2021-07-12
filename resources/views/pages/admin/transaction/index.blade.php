@extends('layouts.admin')

@section('title')
Transaction
@endsection

@section('content')
<div class="section-content section-dashboard-home" data-aos="fade-up">
    <div class="container-fluid">
        <div class="dashboard-heading">
            <h2 class="dashboard-title">Admin Dashboard</h2>
            <p class="dashboard-subtitle">
                This is Sotore Administrator Panel
            </p>
        </div>
        <div class="dashboard-content">
            <div class="row mt-3">
                <div class="col-12 mt-2">
                    <h5 class="mb-3">Recent Transactions</h5>
                    @foreach ($transactions as $transaction)
                    <a class="card card-list d-block" href="{{ route('transaction.edit', $transaction->id) }}">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-1">
                                    <img src="/images/dashboard-arrow-right.svg" alt="" />
                                </div>
                                <div class="col-md-4">
                                    {{ $transaction->code ?? '' }}
                                </div>
                                <div class="col-md-3">
                                    {{ $transaction->created_at ?? '' }}
                                </div>
                                <div class="col-md-1 d-none d-md-block">

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
@endsection