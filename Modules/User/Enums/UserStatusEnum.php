<?php

namespace Modules\User\Enums;

enum UserStatusEnum:int
{
    case STATUS_ACTIVE = 1;
    case STATUS_INACTIVE = 0;
}
