<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use \App\Domain\Event\Entity\User;
use \App\Domain\Communication\Entity\Service;
use App\Domain\Communication\Service\CommunicationService;
use Illuminate\Support\Facades\Auth;

class ServiceController extends Controller
{
    public $message;
    public $users;
    public $clicked_user;
    public $messages;
    public $admin;

    private $service;

    public function __construct()
    {
        $this->service = new CommunicationService();
    }

    public function index()
    {
        $users = User::orderBy('id', 'DESC')->get();

        if (Auth::user()->role == 'admin') {
            $messages = Service::where('user_id', auth()->id())->orWhere('receiver', auth()->id())->orderBy('id', 'DESC')->get();
        }

        return view('service/home', [
            'users' => $users,
            'messages' => $messages ?? null
        ]);
    }

    public function show($id)
    {
        if (Auth::user()->role != 'admin') {
            abort(404);
        }

        $sender = User::findOrFail($id);

        $users = User::with(['message' => function ($query) {
            return $query->orderBy('created_at', 'DESC');
        }])->orderBy('id', 'DESC')->get();

        if (Auth::user()->role != 'admin') {
            $messages = Service::where('user_id', Auth::id())->orWhere('receiver', Auth::id())->orderBy('id', 'DESC')->get();
        } else {
            $messages = Service::where('user_id', $sender)->orWhere('receiver', $sender)->orderBy('id', 'DESC')->get();
        }

        return view('service/show', [
            'users' => $users,
            'messages' => $messages,
            'sender' => $sender,
        ]);
    }

    public function getRender($user, $admin)
    {
        return view('livewire.message', [
            'users' => $user,
            'admin' => $admin
        ]);
    }
    
}
