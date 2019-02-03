@extends('layouts.app')
@section('content')
    <app-component/>
@endsection
@push('script')
    <script>
        window.etfs = '{!! Cache::get('etfs') !!}';
    </script>
@endpush
