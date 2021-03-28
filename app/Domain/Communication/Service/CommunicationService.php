<?php

namespace App\Domain\Communication\Service;

use App\Domain\Communication\Dao\CommunicationDao;
use App\Domain\Communication\Entity\Service;

class CommunicationService
{

    private $dao;

    public function __construct()
    {
        $this->dao = new CommunicationDao();
    }

    public function findAdmin()
    {
        return $this->dao->getAdmin();
    }

    public function findMessageReceiver($id)
    {
        return $this->dao->getMessageReceiver($id);
    }

    public function findUserbyId($user_id)
    {
        return $this->dao->getUserbyId($user_id);
    }

    public function saveService(Service $message)
    {
        return $this->dao->saveService($message);
    }

    public function newMessage()
    {
        return $this->dao->newMessage();
    }

    public function userService($user_id)
    {
        return $this->dao->userService($user_id);
    }

}