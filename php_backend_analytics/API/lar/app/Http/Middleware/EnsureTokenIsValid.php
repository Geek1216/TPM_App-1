<?php

namespace App\Http\Middleware;

use Closure;
use \Firebase\JWT\JWT;
use Illuminate\Http\Request;

class EnsureTokenIsValid
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        try{

            $secret_key = 'Acfd5xy4!';
            $decoded_data = JSON_encode(JWT::decode($request->userToken, $secret_key, array('HS512')));

        }catch(\Exception $e){
            return response()->json(["status"  => 0, "message" =>  $e->getMessage()], 500);
        }
        
        return $next($request);
    }
}
