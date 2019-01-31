@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Dashboard</div>

                    <div class="card-body">
                        @if (session('status'))
                            <div class="alert alert-success" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif
                        {!! Form::open(['method' => 'POST','url' => route('etf.parse')]) !!}
                        @csrf
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1">
                                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                            </span>
                            <input type="text" class="form-control" name="sybmol" placeholder="Type ETF symbol"
                                   aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <button type="submit">{{ __('Find an ETF') }}</button>
                        </div>
                    </div>

                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection
