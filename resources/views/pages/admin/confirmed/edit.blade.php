@extends('layouts.admin')

@section('title')
    Confirmed Payment Detail
@endsection

@section('content')
    <div class="section-content section-dashboard-home" data-aos="fade-up">
        <div class="container-fluid">
            <div class="dashboard-heading">
                <h2 class="dashboard-title">Confirmed Payment</h2>
                <p class="dashboard-subtitle">
                    Confirmed payment info
                </p>
            </div>
            <div class="dashboard-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="container-fluid text-center">
                                    <img src="{{ $payment_image_path }}" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="container-fluid">
                                    <form action="{{ route('confirmed.update', $transaction->id) }}" method="POST">
                                        @method('PATCH')
                                        @csrf
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <input type="submit" class="btn btn-lg btn-block btn-success" name="action"
                                                        value="valid" />
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="submit" class="btn btn-lg btn-block btn-danger" name="action"
                                                        value="invalid" />
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
    @endsection
