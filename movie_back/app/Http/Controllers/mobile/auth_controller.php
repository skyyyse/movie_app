<?php

namespace App\Http\Controllers\mobile;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
class auth_controller extends Controller
{
    public function login(Request $request){
        $attrs = $request->validate([
            'email'     => 'required',
            'password'  => 'required'
        ]);
        if (!Auth::attempt($attrs)) {
            return response([
                'status'=>false,
                'message' => 'Invalid Credentials.'
            ]);
        }else{
            $user = User::where('email', $request['email'])->firstOrFail();
            return response([
                'status'=>true,
                'user' => $user,
                'token' => $user->createToken('secret')->plainTextToken
            ]);
        }
    }

    public function register(Request $request){
        $validate=validator::make($request->all(),[
            'name'=>'required|string',
            'email' =>  "required|email|unique:users,email",
            'password'=>'required',
        ]);
        if($validate->fails()){
            return response()->json([
                'status'=>false,
                "message" => $validate->errors()->all(),
            ]);
        }else{
            $user=User::create([
                'name'=>$request->name,
                'email'=>$request->email,
                'password' => Hash::make($request->password),
            ]);
            if($user){
                return response()->json([
                    'status'=>true,
                    'message'=> 'Create user  sucessfully....',
                    'token' => $user->createToken('secret')->plainTextToken
                ]);
            }else{
                return response()->json([
                    'status'=>false,
                    'message'=> 'Create user not sucessfully....'
                ]);
            }
        }
    }

    public function user(){
        $user=User::where('id',Auth()->user()->id)->get();
        return response()->json([
            'status'=> true,
            'user'=> $user,
        ]);
    }

    public function profile(Request $request){
        $user=Auth()->user();
        if($request->hasFile('image')){
            $imageName = Str::random(40) . '.' . $request->image->getClientOriginalExtension();
            $imagePath = public_path('Image/User/Image') . '/' . $user->image;
            if ($request->image->isValid()) {
                $request->image->move(public_path('Image/User/Image'), $imageName);
                User::where('id', Auth()->user()->id)->update([
                    'name'=> $request->name,
                    'email'=> $request->email,
                    'phone'=> $request->phone,
                    'address'=> $request->textarea,
                    'image'=>$imageName,
                ]);
                return response()->json([
                    'status'=> 'success',
                    'message'=> 'Update user  sucessfully....'
                ]);
            }else{
                if(unlink(filename: $imagePath)){
                    $request->image->move(public_path('Image/User/Image'), $imageName);
                    User::where('id', $request->id)->update([
                        'name'=> $request->name,
                        'email'=> $request->email,
                        'phone'=> $request->phone,
                        'role'=> $request->role,
                        'address'=> $request->textarea,
                        'image'=>$imageName,
                    ]);
                    return redirect()->route(route: 'user.index');
                }
            }
        }else{
            $user=User::where('id',Auth()->user()->id)->update([
                'name'=>$request->name,
                'email'=>$request->email,
                'phone'=>$request->phone,
                'address'=>$request->address,
            ]);
            return response()->json([
                'status'=> 'success',
                'message'=> 'Update user  sucessfully....'
            ]);
        }
    }

    public function changes_password($old_pssword,$new_password){
        $user=Auth()->user();
        if(Hash::check($old_pssword, $user->password)){
            User::where('id',Auth()->user()->id)->update([
                'password'=>Hash::make($new_password),
            ]);
            return response()->json([
                'status'=> true,
                'message'=> 'Update password  sucessfully....'
            ]);
        }else{
            return response()->json([
                'status'=> false,
                'message'=> 'Forgot password  ....'
            ]);
        }
    }

    public function logout(Request $request){
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'message' => 'Logout sucessfully.....',
        ]);
    }
}
