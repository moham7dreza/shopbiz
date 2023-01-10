<?php

namespace Modules\Payment\Repositories;


use Modules\Payment\Entities\Payment;

class PaymentRepoEloquent implements PaymentRepoEloquentInterface
{
    /**
     * Find payment by invoice id.
     *
     * @param  string|int $invoiceId
     * @return \Illuminate\Database\Eloquent\Builder|\Illuminate\Database\Eloquent\Model
     */
    public function findByInvoiceId(int $invoiceId)
    {
        return Payment::query()->where('invoice_id', $invoiceId)->firstOrFail();
    }
}
