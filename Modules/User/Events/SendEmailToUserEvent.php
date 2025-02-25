<?php

namespace Modules\User\Events;

use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class SendEmailToUserEvent
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public ?string $email;
    public ?Model $model;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($email = null, $model = null)
    {
        $this->email = $email;
        $this->model = $model;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('channel-name');
    }
}
