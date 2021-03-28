<?php

namespace App\Domain\Communication\Dao;

use App\Domain\Event\Entity\User;
use App\Domain\Communication\Entity\Service;

class CommunicationDao
{

    public function getAdmin()
    {
        return User::where('role', 'admin')->first();
    }

    public function getMessageReceiver($id)
    {
        return Service::where('user_id', $id)->orWhere('receiver', $id)->orderBy('id', 'DESC')->get();
    }

    public function getUserbyId($user_id)
    {
        return User::find($user_id);
    }

    public function saveService(Service $message)
    {
        return $message->save();
    }

    public function newMessage()
    {
        return new Service();
    }

    public function userService($user_id){
        return Service::where('user_id', $user_id)->get();
    }

}