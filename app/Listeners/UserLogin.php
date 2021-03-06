<?php

namespace App\Listeners;

use Illuminate\Auth\Events\Login;

class UserLogin
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * @param Login $event
     */
    public function handle(Login $event)
    {
        $user = $event->user;
        $message = $user->username.' logged in successfully.';

        activity()
            ->causedBy($user)
            ->withProperties(['IP' => \Request::ip()])
            ->log($message);

        flash($message)->success();
    }
}
