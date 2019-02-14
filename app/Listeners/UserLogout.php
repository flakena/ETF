<?php

namespace App\Listeners;

use Illuminate\Auth\Events\Logout;

class UserLogout
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
     * @param Logout $event
     */
    public function handle(Logout $event)
    {
        $user = $event->user;
        $message = $user->username . ' logged out from system.';
        activity()
            ->causedBy($user)
            ->withProperties(['IP' => \Request::ip()])
            ->log($message);
    }
}
