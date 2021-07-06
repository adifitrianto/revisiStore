@extends('layouts.admin')

@section('title')
    Store Dashboard Transaction Detail
@endsection

@section('content')
<div
  class="section-content section-dashboard-home"
  data-aos="fade-up"
>
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
                      <img
                        src="{{ Storage::url($detail->product['galleries']->first()->photos ?? '') }}"
                        class="w-100 mb-3"
                        alt=""
                      />
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
                          {{ $transaction->user['address_two'] ?? "N/A"}}
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
                      <div class="col-12 col-md-3">
                        <div class="product-title">Transaction Status</div>
                        <select
                          name="transaction_status"
                          id="status"
                          class="form-control"
                          {{-- v-model="status" --}}
                        >
                          <option value="PENDING">Pending</option>
                          <option value="SHIPPING">Shipping</option>
                          <option value="SUCCESS">Success</option>
                        </select>
                      </div>
                      <template v-if="status == 'SHIPPING'">
                        <div class="col-md-3">
                          <div class="product-title">Input Resi</div>
                          <input
                            type="text"
                            class="form-control"
                            name="resi"
                            v-model="resi"
                          />
                        </div>
                        <div class="col-md-2">
                          <button
                            type="submit"
                            class="btn btn-success btn-block mt-4"
                          >
                            Update Resi
                          </button>
                        </div>
                      </template>
                    </div>
                  </div>
                  
                <div class="row mt-4">
                  <div class="col-12 text-right">
                    <button
                      type="submit"
                      class="btn btn-success btn-lg mt-4"
                    >
                      Save Now
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
@endsection

{{-- @push('addon-script')
    <script src="/vendor/vue/vue.js"></script>
    <script>
        var transactionDetails = new Vue({
        el: "#transactionDetails",
        data: {
            status: "{{ $transaction->shipping_status }}",
            resi: "{{ $transaction->resi }}",
        },
        });
    </script>
@endpush --}}