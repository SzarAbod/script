local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={}b.ClassName='Maid'
function b.new()return(setmetatable({_tasks={}},b))end function b.isMaid(c)
return type(c)=='table'and c.ClassName=='Maid'end function b.__index(c,d)if b[d]
then return b[d]else return c._tasks[d]end end function b.__newindex(c,d,e)if b[
d]~=nil then error(string.format("Cannot use '%s' as a Maid key",tostring(d)),2)
end local f=c._tasks local g=f[d]if g==e then return end f[d]=e if g then if
typeof(g)=='function'then(g)()elseif typeof(g)=='table'then local h=g if type(h.
Destroy)=='function'then h:Destroy()end elseif typeof(g)=='Instance'then g:
Destroy()elseif typeof(g)=='thread'then local h if coroutine.running()~=g then h
=pcall(function()task.cancel(g)end)end if not h then task.defer(function()task.
cancel(g)end)end elseif typeof(g)=='RBXScriptConnection'then g:Disconnect()end
end end function b.Add(c,d)if not d then error('Task cannot be false or nil',2)
end c[#((c._tasks))+1]=d if type(d)=='table'and not d.Destroy then warn(
'[Maid.Add] - Gave table task without .Destroy\n\n'..debug.traceback())end
return d end function b.GiveTask(c,d)if not d then error(
'Task cannot be false or nil',2)end local e=#((c._tasks))+1 c[e]=d if type(d)==
'table'and not(d).Destroy then warn(
'[Maid.GiveTask] - Gave table task without .Destroy\n\n'..debug.traceback())end
return e end function b.GivePromise(c,d)if not d:IsPending()then return d end
local e=d.resolved(d)local f=c:GiveTask(e)e:Finally(function()c[f]=nil end)
return e end function b.DoCleaning(c)local d=c._tasks for e,f in d do if typeof(
f)=='RBXScriptConnection'then d[e]=nil f:Disconnect()end end local e,f=next(d)
while f~=nil do d[e]=nil if typeof(f)=='function'then(f)()elseif typeof(f)==
'table'and type((f).Destroy)=='function'then(f):Destroy()elseif typeof(f)==
'Instance'then f:Destroy()elseif typeof(f)=='thread'then local g if coroutine.
running()~=f then g=pcall(function()task.cancel(f)end)end if not g then local h=
f task.defer(function()task.cancel(h)end)end elseif typeof(f)==
'RBXScriptConnection'then f:Disconnect()end e,f=next(d)end end b.Destroy=b.
DoCleaning return b end function a.b()local b=(cloneref or clonereference or
function(b)return b end)local c=b(game:GetService'CoreGui')local d=b(game:
GetService'Players')local e=b(game:GetService'RunService')local f=b(game:
GetService'SoundService')local g=b(game:GetService'UserInputService')local h=b(
game:GetService'TextService')local i=b(game:GetService'Teams')local j=b(game:
GetService'TweenService')local k=getgenv or function()return shared end local l=
setclipboard or nil local m=protectgui or(syn and syn.protect_gui)or function()
end local n=gethui or function()return c end local o=d.LocalPlayer or d.
PlayerAdded:Wait()local p=o:GetMouse()local q={}local r={}local s={}local t={}
local u={LocalPlayer=o,DevicePlatform=nil,IsMobile=false,IsRobloxFocused=true,
ScreenGui=nil,SearchText='',Searching=false,LastSearchTab=nil,ActiveTab=nil,Tabs
={},DependencyBoxes={},KeybindFrame=nil,KeybindContainer=nil,KeybindToggles={},
Notifications={},ToggleKeybind=Enum.KeyCode.RightControl,TweenInfo=TweenInfo.
new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),NotifyTweenInfo=
TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),Toggled=false
,Unloaded=false,Labels=q,Buttons=r,Toggles=s,Options=t,NotifySide='Right',
ShowCustomCursor=true,ForceCheckbox=false,ShowToggleFrameInKeybinds=true,
NotifyOnError=false,CantDragForced=false,Signals={},UnloadSignals={},MinSize=
Vector2.new(480,360),DPIScale=1,CornerRadius=4,IsLightTheme=false,Scheme={
BackgroundColor=Color3.fromRGB(15,15,15),MainColor=Color3.fromRGB(25,25,25),
AccentColor=Color3.fromRGB(125,85,255),OutlineColor=Color3.fromRGB(40,40,40),
FontColor=Color3.new(1,1,1),Font=Font.fromEnum(Enum.Font.Code),Red=Color3.
fromRGB(255,50,50),Dark=Color3.new(0,0,0),White=Color3.new(1,1,1)},Registry={},
DPIRegistry={}}local v={Assets={TransparencyTexture={RobloxId=139785960036434,
Path='Obsidian/assets/TransparencyTexture.png',Id=nil},SaturationMap={RobloxId=
4155801252,Path='Obsidian/assets/SaturationMap.png',Id=nil}}}do local w=
[[https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/]]
local x=function(x,y)if not isfolder or not makefolder then return end local z=x
:split'/'local A=''if y then table.remove(z,#z)end for B,C in ipairs(z)do if not
isfolder(A..C)then makefolder(A..C)end A=A..C..'/'end return A end function v.
GetAsset(y)if not v.Assets[y]then return nil end local z=v.Assets[y]if z.Id then
return z.Id end local A=string.format('rbxassetid://%s',tostring(z.RobloxId))if
getcustomasset then local B,C=pcall(getcustomasset,z.Path)if B and C then A=C
end end z.Id=A return A end function v.DownloadAsset(y)if not getcustomasset or
not writefile or not isfile then return end x(y,true)if isfile(y)then return end
local z=y:gsub('Obsidian/','')writefile(y,game:HttpGet(string.format('%s%s',
tostring(w),tostring(z))))end for y,z in v.Assets do v.DownloadAsset(z.Path)end
end if e:IsStudio()then if g.TouchEnabled and not g.MouseEnabled then u.IsMobile
=true u.MinSize=Vector2.new(480,240)else u.IsMobile=false u.MinSize=Vector2.new(
480,360)end else pcall(function()u.DevicePlatform=g:GetPlatform()end)u.IsMobile=
(u.DevicePlatform==Enum.Platform.Android or u.DevicePlatform==Enum.Platform.IOS)
u.MinSize=u.IsMobile and Vector2.new(480,240)or Vector2.new(480,360)end local w=
{Frame={BorderSizePixel=0},ImageLabel={BackgroundTransparency=1,BorderSizePixel=
0},ImageButton={AutoButtonColor=false,BorderSizePixel=0},ScrollingFrame={
BorderSizePixel=0},TextLabel={BorderSizePixel=0,FontFace='Font',RichText=true,
TextColor3='FontColor'},TextButton={AutoButtonColor=false,BorderSizePixel=0,
FontFace='Font',RichText=true,TextColor3='FontColor'},TextBox={BorderSizePixel=0
,FontFace='Font',PlaceholderColor3=function()local w,x,y=u.Scheme.FontColor:
ToHSV()return Color3.fromHSV(w,x,y/2)end,Text='',TextColor3='FontColor'},
UIListLayout={SortOrder=Enum.SortOrder.LayoutOrder},UIStroke={ApplyStrokeMode=
Enum.ApplyStrokeMode.Border},Window={Title='No Title',Footer='No Footer',
Position=UDim2.fromOffset(6,6),Size=UDim2.fromOffset(720,600),IconSize=UDim2.
fromOffset(30,30),AutoShow=true,Center=true,Resizable=true,CornerRadius=4,
NotifySide='Right',ShowCustomCursor=true,Font=Enum.Font.Code,ToggleKeybind=Enum.
KeyCode.RightControl,MobileButtonsSide='Left'},Toggle={Text='Toggle',Default=
false,Callback=function()end,Changed=function()end,Risky=false,Disabled=false,
Visible=true},Input={Text='Input',Default='',Finished=false,Numeric=false,
ClearTextOnFocus=true,Placeholder='',AllowEmpty=true,EmptyReset='---',Callback=
function()end,Changed=function()end,Disabled=false,Visible=true},Slider={Text=
'Slider',Default=0,Min=0,Max=100,Rounding=0,Prefix='',Suffix='',Callback=
function()end,Changed=function()end,Disabled=false,Visible=true},Dropdown={
Values={},DisabledValues={},Multi=false,MaxVisibleDropdownItems=8,Callback=
function()end,Changed=function()end,Disabled=false,Visible=true},Viewport={
Object=nil,Camera=nil,Clone=true,AutoFocus=true,Interactive=false,Height=200,
Visible=true},Image={Image='',Transparency=0,Color=Color3.new(1,1,1),RectOffset=
Vector2.zero,RectSize=Vector2.zero,ScaleType=Enum.ScaleType.Fit,Height=200,
Visible=true},KeyPicker={Text='KeyPicker',Default='None',Mode='Toggle',Modes={
'Always','Toggle','Hold'},SyncToggleState=false,Callback=function()end,
ChangedCallback=function()end,Changed=function()end,Clicked=function()end},
ColorPicker={Default=Color3.new(1,1,1),Callback=function()end,Changed=function()
end}}local x={Bottom={0,1},Right={1,0}}local y={Left={0.5,1},Right={0.5,1}}local
z=function(z,A)if typeof(z)=='UDim'then return UDim.new(z.Scale,z.Offset*u.
DPIScale)end if A then return UDim2.new(z.X.Scale,(z.X.Offset*u.DPIScale)+(A[1]*
u.DPIScale),z.Y.Scale,(z.Y.Offset*u.DPIScale)+(A[2]*u.DPIScale))end return UDim2
.new(z.X.Scale,z.X.Offset*u.DPIScale,z.Y.Scale,z.Y.Offset*u.DPIScale)end local A
=function(A)return A*u.DPIScale end local B=function(B,C,D)local E=Instance.new
'BindableEvent'local F=B:Once(function(...)if not D or typeof(D)=='function'and
D(...)then E:Fire(true)else E:Fire(false)end end)task.delay(C,function()F:
Disconnect()E:Fire(false)end)local G=E.Event:Wait()E:Destroy()return G end local
C=function(C,D)return C.UserInputType==Enum.UserInputType.MouseButton1 or D and
C.UserInputType==Enum.UserInputType.MouseButton2 or C.UserInputType==Enum.
UserInputType.Touch end local D=function(D,E)return C(D,E)and D.UserInputState==
Enum.UserInputState.Begin and u.IsRobloxFocused end local E=function(E)return(E.
UserInputType==Enum.UserInputType.MouseMovement or E.UserInputType==Enum.
UserInputType.Touch)and E.UserInputState==Enum.UserInputState.Change end local F
=function(F)local G=0 for H,I in pairs(F)do G=G+1 end return G end local G=
function(G)if not(G and G.PlaybackState==Enum.PlaybackState.Playing)then return
end G:Cancel()end local I=function(I)return I:match'^%s*(.-)%s*$'end local J=
function(J,K)local L=K>=0 if K==0 then return math.floor(J)end return tonumber(
string.format('%.'..K..'f',J))end local K=function(K)local L=d:GetPlayers()if K
then local M=table.find(L,o)if M then table.remove(L,M)end end table.sort(L,
function(M,N)return M.Name:lower()<N.Name:lower()end)return L end local L=
function()local L=i:GetTeams()table.sort(L,function(M,N)return M.Name:lower()<N.
Name:lower()end)return L end function u.UpdateKeybindFrame(M)if not u.
KeybindFrame then return end local N=0 for O,P in pairs(u.KeybindToggles)do if
not P.Holder.Visible then continue end local Q=P.Label.Size.X.Offset+P.Label.
Position.X.Offset if Q>N then N=Q end end u.KeybindFrame.Size=UDim2.fromOffset(N
+18*u.DPIScale,0)end function u.UpdateDependencyBoxes(M)for N,O in pairs(u.
DependencyBoxes)do O:Update(true)end if u.Searching then u:UpdateSearch(u.
SearchText)end end local function CheckDepbox(M,N)local O=0 for P,Q in pairs(M.
Elements)do if Q.Type=='Divider'then Q.Holder.Visible=false continue elseif Q.
SubButton then local R=false if Q.Text:lower():match(N)and Q.Visible then R=true
else Q.Base.Visible=false end if Q.SubButton.Text:lower():match(N)and Q.
SubButton.Visible then R=true else Q.SubButton.Base.Visible=false end Q.Holder.
Visible=R if R then O=O+1 end continue end if Q.Text and Q.Text:lower():match(N)
and Q.Visible then Q.Holder.Visible=true O=O+1 else Q.Holder.Visible=false end
end for P,Q in pairs(M.DependencyBoxes)do if not Q.Visible then continue end O=O
+CheckDepbox(Q,N)end return O end local function RestoreDepbox(M)for N,O in
pairs(M.Elements)do O.Holder.Visible=typeof(O.Visible)=='boolean'and O.Visible
or true if O.SubButton then O.Base.Visible=O.Visible O.SubButton.Base.Visible=O.
SubButton.Visible end end M:Resize()M.Holder.Visible=true for N,O in pairs(M.
DependencyBoxes)do if not O.Visible then continue end RestoreDepbox(O)end end
function u.UpdateSearch(M,N)u.SearchText=N if u.LastSearchTab then for O,P in
pairs(u.LastSearchTab.Groupboxes)do for Q,R in pairs(P.Elements)do R.Holder.
Visible=typeof(R.Visible)=='boolean'and R.Visible or true if R.SubButton then R.
Base.Visible=R.Visible R.SubButton.Base.Visible=R.SubButton.Visible end end for
Q,R in pairs(P.DependencyBoxes)do if not R.Visible then continue end
RestoreDepbox(R)end P:Resize()P.Holder.Visible=true end for O,P in pairs(u.
LastSearchTab.Tabboxes)do for Q,R in pairs(P.Tabs)do for S,T in pairs(R.Elements
)do T.Holder.Visible=typeof(T.Visible)=='boolean'and T.Visible or true if T.
SubButton then T.Base.Visible=T.Visible T.SubButton.Base.Visible=T.SubButton.
Visible end end for S,T in pairs(R.DependencyBoxes)do if not T.Visible then
continue end RestoreDepbox(T)end R.ButtonHolder.Visible=true end P.ActiveTab:
Resize()P.Holder.Visible=true end for O,P in pairs(u.LastSearchTab.
DependencyGroupboxes)do if not P.Visible then continue end for Q,R in pairs(P.
Elements)do R.Holder.Visible=typeof(R.Visible)=='boolean'and R.Visible or true
if R.SubButton then R.Base.Visible=R.Visible R.SubButton.Base.Visible=R.
SubButton.Visible end end for Q,R in pairs(P.DependencyBoxes)do if not R.Visible
then continue end RestoreDepbox(R)end P:Resize()P.Holder.Visible=true end end
local O=N:lower()if I(O)==''or u.ActiveTab.IsKeyTab then u.Searching=false u.
LastSearchTab=nil return end u.Searching=true for P,Q in pairs(u.ActiveTab.
Groupboxes)do local R=0 for S,T in pairs(Q.Elements)do if T.Type=='Divider'then
T.Holder.Visible=false continue elseif T.SubButton then local U=false if T.Text:
lower():match(O)and T.Visible then U=true else T.Base.Visible=false end if T.
SubButton.Text:lower():match(O)and T.SubButton.Visible then U=true else T.
SubButton.Base.Visible=false end T.Holder.Visible=U if U then R=R+1 end continue
end if T.Text and T.Text:lower():match(O)and T.Visible then T.Holder.Visible=
true R=R+1 else T.Holder.Visible=false end end for S,T in pairs(Q.
DependencyBoxes)do if not T.Visible then continue end R=R+CheckDepbox(T,O)end if
R>0 then Q:Resize()end Q.Holder.Visible=R>0 end for P,Q in pairs(u.ActiveTab.
Tabboxes)do local R=0 local S={}for T,U in pairs(Q.Tabs)do S[U]=0 for V,W in
pairs(U.Elements)do if W.Type=='Divider'then W.Holder.Visible=false continue
elseif W.SubButton then local X=false if W.Text:lower():match(O)and W.Visible
then X=true else W.Base.Visible=false end if W.SubButton.Text:lower():match(O)
and W.SubButton.Visible then X=true else W.SubButton.Base.Visible=false end W.
Holder.Visible=X if X then S[U]=S[U]+1 end continue end if W.Text and W.Text:
lower():match(O)and W.Visible then W.Holder.Visible=true S[U]=S[U]+1 else W.
Holder.Visible=false end end for V,W in pairs(U.DependencyBoxes)do if not W.
Visible then continue end S[U]=S[U]+CheckDepbox(W,O)end end for T,U in pairs(S)
do T.ButtonHolder.Visible=U>0 if U>0 then R=R+1 if Q.ActiveTab==T then T:Resize(
)elseif S[Q.ActiveTab]==0 then T:Show()end end end Q.Holder.Visible=R>0 end for
P,Q in pairs(u.ActiveTab.DependencyGroupboxes)do if not Q.Visible then continue
end local R=0 for S,T in pairs(Q.Elements)do if T.Type=='Divider'then T.Holder.
Visible=false continue elseif T.SubButton then local U=false if T.Text:lower():
match(O)and T.Visible then U=true else T.Base.Visible=false end if T.SubButton.
Text:lower():match(O)and T.SubButton.Visible then U=true else T.SubButton.Base.
Visible=false end T.Holder.Visible=U if U then R=R+1 end continue end if T.Text
and T.Text:lower():match(O)and T.Visible then T.Holder.Visible=true R=R+1 else T
.Holder.Visible=false end end for S,T in pairs(Q.DependencyBoxes)do if not T.
Visible then continue end R=R+CheckDepbox(T,O)end if R>0 then Q:Resize()end Q.
Holder.Visible=R>0 end u.LastSearchTab=u.ActiveTab end function u.AddToRegistry(
M,N,O)u.Registry[N]=O end function u.RemoveFromRegistry(M,N)u.Registry[N]=nil
end function u.UpdateColorsUsingRegistry(M)for N,O in pairs(u.Registry)do for P,
Q in pairs(O)do if typeof(Q)=='string'then N[P]=u.Scheme[Q]elseif typeof(Q)==
'function'then N[P]=Q()end end end end function u.UpdateDPI(M,N,O)if not u.
DPIRegistry[N]then return end for P,Q in pairs(O)do u.DPIRegistry[N][P]=Q and Q
or nil end end function u.SetDPIScale(M,N)u.DPIScale=N/100 u.MinSize=u.MinSize*u
.DPIScale for O,P in pairs(u.DPIRegistry)do for Q,R in pairs(P)do if Q==
'DPIExclude'or Q=='DPIOffset'then continue elseif Q=='TextSize'then O[Q]=A(R)
else O[Q]=z(R,P.DPIOffset[Q])end end end for O,P in pairs(u.Tabs)do if P.
IsKeyTab then continue end P:Resize(true)for Q,R in pairs(P.Groupboxes)do R:
Resize()end for Q,R in pairs(P.Tabboxes)do for S,T in pairs(R.Tabs)do T:Resize()
end end end for O,P in pairs(t)do if P.Type=='Dropdown'then P:
RecalculateListSize()elseif P.Type=='KeyPicker'then P:Update()end end u:
UpdateKeybindFrame()for O,P in pairs(u.Notifications)do P:Resize()end end
function u.GiveSignal(M,N)table.insert(u.Signals,N)return N end local M,N=pcall(
function()return loadstring(game:HttpGet
[[https://raw.githubusercontent.com/deividcomsono/lucide-roblox-direct/refs/heads/main/source.lua]]
)()end)function u.GetIcon(O,P)if not M then return end local Q,R=pcall(N.
GetAsset,P)if not Q then return end return R end function u.Validate(O,P,Q)if
typeof(P)~='table'then return Q end for R,S in pairs(Q)do if typeof(R)=='number'
then continue end if typeof(S)=='table'then P[R]=u:Validate(P[R],S)elseif P[R]==
nil then P[R]=S end end return P end local O=function(O,P)local Q=u.Registry[P]
or{}local R=u.DPIRegistry[P]or{}local S=R.DPIExclude or O.DPIExclude or{}local T
=R.DPIOffset or O.DPIOffset or{}for U,V in pairs(O)do if U=='DPIExclude'or U==
'DPIOffset'then continue elseif Q[U]then Q[U]=nil elseif U~='Text'and(u.Scheme[V
]or typeof(V)=='function')then Q[U]=V P[U]=u.Scheme[V]or V()continue end if not
S[U]then if U=='Position'or U=='Size'or U:match'Padding'then R[U]=V V=z(V,T[U])
elseif U=='TextSize'then R[U]=V V=A(V)end end P[U]=V end if F(Q)>0 then u.
Registry[P]=Q end if F(R)>0 then R.DPIExclude=S R.DPIOffset=T u.DPIRegistry[P]=R
end end local P=function(P,Q)local R=Instance.new(P)if w[P]then O(w[P],R)end O(Q
,R)if Q.Parent and not Q.ZIndex then pcall(function()R.ZIndex=Q.Parent.ZIndex
end)end return R end local Q=function(Q,R)if not pcall(function()if not R then R
=c end local S if typeof(R)=='function'then S=R()else S=R end Q.Parent=S end)
then Q.Parent=u.LocalPlayer:WaitForChild('PlayerGui',math.huge)end end local R=
function(R,S)if S then Q(R,c)return end pcall(m,R)Q(R,n)end local S=P(
'ScreenGui',{Name='Obsidian',DisplayOrder=999,ResetOnSpawn=false})R(S)u.
ScreenGui=S S.DescendantRemoving:Connect(function(T)u:RemoveFromRegistry(T)u.
DPIRegistry[T]=nil end)local T=P('ScreenGui',{Name='ObsidanModal',DisplayOrder=
999,ResetOnSpawn=false})R(T,true)local U=P('TextButton',{BackgroundTransparency=
1,Modal=false,Size=UDim2.fromScale(0,0),Text='',ZIndex=-999,Parent=T})local V do
V=P('Frame',{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3='White',Size=
UDim2.fromOffset(9,1),Visible=false,ZIndex=999,Parent=S})P('Frame',{AnchorPoint=
Vector2.new(0.5,0.5),BackgroundColor3='Dark',Position=UDim2.fromScale(0.5,0.5),
Size=UDim2.new(1,2,1,2),ZIndex=998,Parent=V})local W=P('Frame',{AnchorPoint=
Vector2.new(0.5,0.5),BackgroundColor3='White',Position=UDim2.fromScale(0.5,0.5),
Size=UDim2.fromOffset(1,9),Parent=V})P('Frame',{AnchorPoint=Vector2.new(0.5,0.5)
,BackgroundColor3='Dark',Position=UDim2.fromScale(0.5,0.5),Size=UDim2.new(1,2,1,
2),ZIndex=998,Parent=W})end local W local X do W=P('Frame',{AnchorPoint=Vector2.
new(1,0),BackgroundTransparency=1,Position=UDim2.new(1,-6,0,6),Size=UDim2.new(0,
300,1,-6),Parent=S})X=P('UIListLayout',{HorizontalAlignment=Enum.
HorizontalAlignment.Right,Padding=UDim.new(0,6),Parent=W})end function u.
GetBetterColor(Y,Z,_)_=_*(u.IsLightTheme and-4 or 2)return Color3.fromRGB(math.
clamp(Z.R*255+_,0,255),math.clamp(Z.G*255+_,0,255),math.clamp(Z.B*255+_,0,255))
end function u.GetDarkerColor(Y,Z)local _,aa,ab=Z:ToHSV()return Color3.fromHSV(_
,aa,ab/2)end function u.GetKeyString(aa,ab)if ab.EnumType==Enum.KeyCode and ab.
Value>33 and ab.Value<127 then return string.char(ab.Value)end return ab.Name
end function u.GetTextBounds(aa,ab,Y,Z,_)local ac=Instance.new
'GetTextBoundsParams'ac.Text=ab ac.RichText=true ac.Font=Y ac.Size=Z ac.Width=_
or workspace.CurrentCamera.ViewportSize.X-32 local ad=h:GetTextBoundsAsync(ac)
return ad.X,ad.Y end function u.MouseIsOverFrame(aa,ab,ac)local ad,Y=ab.
AbsolutePosition,ab.AbsoluteSize return ac.X>=ad.X and ac.X<=ad.X+Y.X and ac.Y>=
ad.Y and ac.Y<=ad.Y+Y.Y end function u.SafeCallback(aa,ab,...)if not(ab and
typeof(ab)=='function')then return end local ac=table.pack(xpcall(ab,function(ac
)task.defer(error,debug.traceback(ac,2))if u.NotifyOnError then u:Notify(ac)end
return ac end,...))if not ac[1]then return nil end return table.unpack(ac,2,ac.n
)end function u.MakeDraggable(aa,ab,ac,ad,Y)local Z local _ local ae=false local
af ac.InputBegan:Connect(function(ag)if not D(ag)or Y and u.CantDragForced then
return end Z=ag.Position _=ab.Position ae=true af=ag.Changed:Connect(function()
if ag.UserInputState~=Enum.UserInputState.End then return end ae=false if af and
af.Connected then af:Disconnect()af=nil end end)end)u:GiveSignal(g.InputChanged:
Connect(function(ag)if(not ad and not u.Toggled)or(Y and u.CantDragForced)or not
(S and S.Parent)then ae=false if af and af.Connected then af:Disconnect()af=nil
end return end if ae and E(ag)then local ah=ag.Position-Z ab.Position=UDim2.new(
_.X.Scale,_.X.Offset+ah.X,_.Y.Scale,_.Y.Offset+ah.Y)end end))end function u.
MakeResizable(aa,ab,ac,ad)local ae local af local ag=false local ah ac.
InputBegan:Connect(function(Y)if not D(Y)then return end ae=Y.Position af=ab.
Size ag=true ah=Y.Changed:Connect(function()if Y.UserInputState~=Enum.
UserInputState.End then return end ag=false if ah and ah.Connected then ah:
Disconnect()ah=nil end end)end)u:GiveSignal(g.InputChanged:Connect(function(Y)if
not ab.Visible or not(S and S.Parent)then ag=false if ah and ah.Connected then
ah:Disconnect()ah=nil end return end if ag and E(Y)then local Z=Y.Position-ae ab
.Size=UDim2.new(af.X.Scale,math.clamp(af.X.Offset+Z.X,u.MinSize.X,math.huge),af.
Y.Scale,math.clamp(af.Y.Offset+Z.Y,u.MinSize.Y,math.huge))if ad then u:
SafeCallback(ad)end end end))end function u.MakeCover(aa,ab,ac)local ad=x[ac]or{
0,0}local ae=y[ac]or{1,0.5}local af=P('Frame',{AnchorPoint=Vector2.new(ad[1],ad[
2]),BackgroundColor3=ab.BackgroundColor3,Position=UDim2.fromScale(ad[1],ad[2]),
Size=UDim2.fromScale(ae[1],ae[2]),Parent=ab})return af end function u.MakeLine(
aa,ab,ac)local ad=P('Frame',{AnchorPoint=ac.AnchorPoint or Vector2.zero,
BackgroundColor3='OutlineColor',Position=ac.Position,Size=ac.Size,Parent=ab})
return ad end function u.MakeOutline(aa,ab,ac,ad)local ae=P('Frame',{
BackgroundColor3='Dark',Position=UDim2.fromOffset(-2,-2),Size=UDim2.new(1,4,1,4)
,ZIndex=ad,Parent=ab})local af=P('Frame',{BackgroundColor3='OutlineColor',
Position=UDim2.fromOffset(1,1),Size=UDim2.new(1,-2,1,-2),ZIndex=ad,Parent=ae})if
ac and ac>0 then P('UICorner',{CornerRadius=UDim.new(0,ac+1),Parent=ae})P(
'UICorner',{CornerRadius=UDim.new(0,ac),Parent=af})end return ae end function u.
AddDraggableButton(aa,ab,ac)local ad={}local ae=P('TextButton',{BackgroundColor3
='BackgroundColor',Position=UDim2.fromOffset(6,6),TextSize=16,ZIndex=10,Parent=S
,DPIExclude={Position=true}})P('UICorner',{CornerRadius=UDim.new(0,u.
CornerRadius-1),Parent=ae})u:MakeOutline(ae,u.CornerRadius,9)ad.Button=ae ae.
MouseButton1Click:Connect(function()u:SafeCallback(ac,ad)end)u:MakeDraggable(ae,
ae,true)function ad.SetText(af,ag)local ah,Y=u:GetTextBounds(ag,u.Scheme.Font,16
)ae.Text=ag ae.Size=UDim2.fromOffset(ah*u.DPIScale*2,Y*u.DPIScale*2)u:UpdateDPI(
ae,{Size=UDim2.fromOffset(ah*2,Y*2)})end ad:SetText(ab)return ad end function u.
AddDraggableMenu(aa,ab)local ac=u:MakeOutline(S,u.CornerRadius,10)ac.
AutomaticSize=Enum.AutomaticSize.Y ac.Position=UDim2.fromOffset(6,6)ac.Size=
UDim2.fromOffset(0,0)u:UpdateDPI(ac,{Position=false,Size=false})local ad=P(
'Frame',{BackgroundColor3='BackgroundColor',Position=UDim2.fromOffset(2,2),Size=
UDim2.new(1,-4,1,-4),Parent=ac})P('UICorner',{CornerRadius=UDim.new(0,u.
CornerRadius-1),Parent=ad})u:MakeLine(ad,{Position=UDim2.fromOffset(0,34),Size=
UDim2.new(1,0,0,1)})local ae=P('TextLabel',{BackgroundTransparency=1,Size=UDim2.
new(1,0,0,34),Text=ab,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,Parent
=ad})P('UIPadding',{PaddingLeft=UDim.new(0,12),PaddingRight=UDim.new(0,12),
Parent=ae})local af=P('Frame',{BackgroundTransparency=1,Position=UDim2.
fromOffset(0,35),Size=UDim2.new(1,0,1,-35),Parent=ad})P('UIListLayout',{Padding=
UDim.new(0,7),Parent=af})P('UIPadding',{PaddingBottom=UDim.new(0,7),PaddingLeft=
UDim.new(0,7),PaddingRight=UDim.new(0,7),PaddingTop=UDim.new(0,7),Parent=af})u:
MakeDraggable(ac,ae,true)return ac,af end do local aa=u:MakeOutline(S,u.
CornerRadius,10)aa.AutomaticSize=Enum.AutomaticSize.Y aa.Position=UDim2.
fromOffset(6,6)aa.Size=UDim2.fromOffset(0,0)aa.Visible=false u:UpdateDPI(aa,{
Position=false,Size=false})local ab=P('Frame',{BackgroundColor3=
'BackgroundColor',Position=UDim2.fromOffset(2,2),Size=UDim2.new(1,-4,1,-4),
Parent=aa})P('UICorner',{CornerRadius=UDim.new(0,u.CornerRadius-1),Parent=ab})
local ac=P('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,32),
Position=UDim2.fromOffset(0,-8*u.DPIScale+7),Text='',TextSize=15,TextXAlignment=
Enum.TextXAlignment.Left,Parent=ab})P('UIPadding',{PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),Parent=ac})u:MakeDraggable(aa,ac,true)local ad=
function()local ad,ae=u:GetTextBounds(ac.Text,u.Scheme.Font,15)aa.Size=UDim2.
fromOffset((12+ad+12+4)*u.DPIScale,ae*u.DPIScale*2+4)u:UpdateDPI(aa,{Size=UDim2.
fromOffset(12+ad+12+4,ae*2+4)})end function u.SetWatermarkVisibility(ae,af)aa.
Visible=af if af then ad()end end function u.SetWatermark(ae,af)ac.Text=af ad()
end end local aa function u.AddContextMenu(ab,ac,ad,ae,af,ag)local ah if af then
ah=P('ScrollingFrame',{AutomaticCanvasSize=af==2 and Enum.AutomaticSize.Y or
Enum.AutomaticSize.None,AutomaticSize=af==1 and Enum.AutomaticSize.Y or Enum.
AutomaticSize.None,BackgroundColor3='BackgroundColor',BorderColor3=
'OutlineColor',BorderSizePixel=1,BottomImage=
'rbxasset://textures/ui/Scroll/scroll-middle.png',CanvasSize=UDim2.fromOffset(0,
0),ScrollBarImageColor3='OutlineColor',ScrollBarThickness=af==2 and 2 or 0,Size=
typeof(ad)=='function'and ad()or ad,TopImage=
'rbxasset://textures/ui/Scroll/scroll-middle.png',Visible=false,ZIndex=10,Parent
=S,DPIExclude={Position=true}})else ah=P('Frame',{BackgroundColor3=
'BackgroundColor',BorderColor3='OutlineColor',BorderSizePixel=1,Size=typeof(ad)
=='function'and ad()or ad,Visible=false,ZIndex=10,Parent=S,DPIExclude={Position=
true}})end local Y={Active=false,Holder=ac,Menu=ah,List=nil,Signal=nil,Size=ad}
if af then Y.List=P('UIListLayout',{Parent=ah})end function Y.Open(Z)if aa==Y
then return elseif aa then aa:Close()end aa=Y Y.Active=true if typeof(ae)==
'function'then ah.Position=UDim2.fromOffset(math.floor(ac.AbsolutePosition.X+ae(
)[1]),math.floor(ac.AbsolutePosition.Y+ae()[2]))else ah.Position=UDim2.
fromOffset(math.floor(ac.AbsolutePosition.X+ae[1]),math.floor(ac.
AbsolutePosition.Y+ae[2]))end if typeof(Y.Size)=='function'then ah.Size=Y.Size()
else ah.Size=z(Y.Size)end if typeof(ag)=='function'then u:SafeCallback(ag,true)
end ah.Visible=true Y.Signal=ac:GetPropertyChangedSignal'AbsolutePosition':
Connect(function()if typeof(ae)=='function'then ah.Position=UDim2.fromOffset(
math.floor(ac.AbsolutePosition.X+ae()[1]),math.floor(ac.AbsolutePosition.Y+ae()[
2]))else ah.Position=UDim2.fromOffset(math.floor(ac.AbsolutePosition.X+ae[1]),
math.floor(ac.AbsolutePosition.Y+ae[2]))end end)end function Y.Close(Z)if aa~=Y
then return end ah.Visible=false if Y.Signal then Y.Signal:Disconnect()Y.Signal=
nil end Y.Active=false aa=nil if typeof(ag)=='function'then u:SafeCallback(ag,
false)end end function Y.Toggle(Z)if Y.Active then Y:Close()else Y:Open()end end
function Y.SetSize(Z,_)Y.Size=_ ah.Size=typeof(_)=='function'and _()or _ end
return Y end u:GiveSignal(g.InputBegan:Connect(function(ab)if D(ab,true)then
local ac=ab.Position if aa and not(u:MouseIsOverFrame(aa.Menu,ac)or u:
MouseIsOverFrame(aa.Holder,ac))then aa:Close()end end end))local ab=P(
'TextLabel',{BackgroundColor3='BackgroundColor',BorderColor3='OutlineColor',
BorderSizePixel=1,TextSize=14,TextWrapped=true,Visible=false,ZIndex=20,Parent=S}
)ab:GetPropertyChangedSignal'AbsolutePosition':Connect(function()local ac,ad=u:
GetTextBounds(ab.Text,ab.FontFace,ab.TextSize,workspace.CurrentCamera.
ViewportSize.X-ab.AbsolutePosition.X-4)ab.Size=UDim2.fromOffset(ac+8*u.DPIScale,
ad+4*u.DPIScale)u:UpdateDPI(ab,{Size=UDim2.fromOffset(ac,ad),DPIOffset={Size={8,
4}}})end)local ac function u.AddTooltip(ad,ae,af,ag)local ah={Disabled=false,
Hovering=false,Signals={}}local Y=function()if ac==ag or(aa and u:
MouseIsOverFrame(aa.Menu,p))or(ah.Disabled and typeof(af)~='string')or(not ah.
Disabled and typeof(ae)~='string')then return end ac=ag ab.Text=ah.Disabled and
af or ae ab.Visible=true while u.Toggled and u:MouseIsOverFrame(ag,p)and not(aa
and u:MouseIsOverFrame(aa.Menu,p))do ab.Position=UDim2.fromOffset(p.X+(u.
ShowCustomCursor and 8 or 14),p.Y+(u.ShowCustomCursor and 8 or 12))e.
RenderStepped:Wait()end ab.Visible=false ac=nil end table.insert(ah.Signals,ag.
MouseEnter:Connect(Y))table.insert(ah.Signals,ag.MouseMoved:Connect(Y))table.
insert(ah.Signals,ag.MouseLeave:Connect(function()if ac~=ag then return end ab.
Visible=false ac=nil end))function ah.Destroy(Z)for _=#ah.Signals,1,-1 do local
ai=table.remove(ah.Signals,_)ai:Disconnect()end if ac==ag then ab.Visible=false
ac=nil end end return ah end function u.OnUnload(ad,ae)table.insert(u.
UnloadSignals,ae)end function u.Unload(ad)for ae=#u.Signals,1,-1 do local af=
table.remove(u.Signals,ae)af:Disconnect()end for ae,af in pairs(u.UnloadSignals)
do u:SafeCallback(af)end u.Unloaded=true S:Destroy()T:Destroy()k().Library=nil
end local ad=u:GetIcon'check'local ae=u:GetIcon'chevron-up'local af=u:GetIcon
'move-diagonal-2'local ag=u:GetIcon'key'local ah={}do local ai={}function ai.
AddKeyPicker(Y,Z,_)_=u:Validate(_,w.KeyPicker)local aj=Y local ak=aj.TextLabel
local al={Text=_.Text,Value=_.Default,Toggled=false,Mode=_.Mode,SyncToggleState=
_.SyncToggleState,Callback=_.Callback,ChangedCallback=_.ChangedCallback,Changed=
_.Changed,Clicked=_.Clicked,Type='KeyPicker'}if al.SyncToggleState then _.Modes=
{'Toggle'}_.Mode='Toggle'end local am={MB1=Enum.UserInputType.MouseButton1,MB2=
Enum.UserInputType.MouseButton2,MB3=Enum.UserInputType.MouseButton3}local an={[
Enum.UserInputType.MouseButton1]='MB1',[Enum.UserInputType.MouseButton2]='MB2',[
Enum.UserInputType.MouseButton3]='MB3'}local ao=P('TextButton',{BackgroundColor3
='MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,Size=UDim2.
fromOffset(18,18),Text=al.Value,TextSize=14,Parent=ak})local ap={Normal=al.Mode
~='Toggle'}do local aq=P('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1
,0,0,16),Text='',Visible=not _.NoUI,Parent=u.KeybindContainer})local ar=P(
'TextLabel',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextSize
=14,TextTransparency=0.5,Parent=aq,DPIExclude={Size=true}})local as=P('Frame',{
BackgroundColor3='MainColor',Size=UDim2.fromOffset(14,14),SizeConstraint=Enum.
SizeConstraint.RelativeYY,Parent=aq})P('UICorner',{CornerRadius=UDim.new(0,u.
CornerRadius/2),Parent=as})P('UIStroke',{Color='OutlineColor',Parent=as})local
at=P('ImageLabel',{Image=ad and ad.Url or'',ImageColor3='FontColor',
ImageRectOffset=ad and ad.ImageRectOffset or Vector2.zero,ImageRectSize=ad and
ad.ImageRectSize or Vector2.zero,ImageTransparency=1,Position=UDim2.fromOffset(2
,2),Size=UDim2.new(1,-4,1,-4),Parent=as})function ap.Display(au,av)ar.
TextTransparency=av and 0 or 0.5 at.ImageTransparency=av and 0 or 1 end function
ap.SetText(au,av)local aw=u:GetTextBounds(av,ar.FontFace,ar.TextSize)ar.Text=av
ar.Size=UDim2.new(0,aw,1,0)end function ap.SetVisibility(au,av)aq.Visible=av end
function ap.SetNormal(au,av)ap.Normal=av aq.Active=not av ar.Position=av and
UDim2.fromOffset(0,0)or UDim2.fromOffset(22*u.DPIScale,0)as.Visible=not av end
aq.MouseButton1Click:Connect(function()if ap.Normal then return end al.Toggled=
not al.Toggled al:DoClick()end)ap.Holder=aq ap.Label=ar ap.Checkbox=as ap.Loaded
=true table.insert(u.KeybindToggles,ap)end local aq=u:AddContextMenu(ao,UDim2.
fromOffset(62,0),function()return{ao.AbsoluteSize.X+1.5,0.5}end,1)al.Menu=aq
local ar={}for as,at in pairs(_.Modes)do local au={}local av=P('TextButton',{
BackgroundColor3='MainColor',BackgroundTransparency=1,Size=UDim2.new(1,0,0,21),
Text=at,TextSize=14,TextTransparency=0.5,Parent=aq.Menu})function au.Select(aw)
for ax,ay in pairs(ar)do ay:Deselect()end al.Mode=at av.BackgroundTransparency=0
av.TextTransparency=0 aq:Close()end function au.Deselect(aw)al.Mode=nil av.
BackgroundTransparency=1 av.TextTransparency=0.5 end av.MouseButton1Click:
Connect(function()au:Select()end)if al.Mode==at then au:Select()end ar[at]=au
end function al.Display(as)if u.Unloaded then return end local at,au=u:
GetTextBounds(al.Value,ao.FontFace,ao.TextSize,ak.AbsoluteSize.X)ao.Text=al.
Value ao.Size=UDim2.fromOffset(at+9*u.DPIScale,au+4*u.DPIScale)end function al.
Update(as)al:Display()if _.NoUI then return end if al.Mode=='Toggle'and aj.Type
=='Toggle'and aj.Disabled then ap:SetVisibility(false)return end local at=al:
GetState()local au=u.ShowToggleFrameInKeybinds and al.Mode=='Toggle'if ap.Loaded
then if au then ap:SetNormal(false)else ap:SetNormal(true)end ap:SetText((
'[%s] %s (%s)'):format(al.Value,al.Text,al.Mode))ap:SetVisibility(true)ap:
Display(at)end u:UpdateKeybindFrame()end function al.GetState(as)if al.Mode==
'Always'then return true elseif al.Mode=='Hold'then local at=al.Value if at==
'None'then return false end if am[at]~=nil then return g:IsMouseButtonPressed(am
[at])and not g:GetFocusedTextBox()else return g:IsKeyDown(Enum.KeyCode[at])and
not g:GetFocusedTextBox()end else return al.Toggled end end function al.
OnChanged(as,at)al.Changed=at end function al.OnClick(as,at)al.Clicked=at end
function al.DoClick(as)if aj.Type=='Toggle'and al.SyncToggleState then aj:
SetValue(al.Toggled)end u:SafeCallback(al.Callback,al.Toggled)u:SafeCallback(al.
Changed,al.Toggled)end function al.SetValue(as,at)local au,av=at[1],at[2]al.
Value=au if ar[av]then ar[av]:Select()end al:Update()end function al.SetText(as,
at)ap:SetText(at)al:Update()end local as=false ao.MouseButton1Click:Connect(
function()if as then return end as=true ao.Text='...'ao.Size=UDim2.fromOffset(29
*u.DPIScale,18*u.DPIScale)local at=g.InputBegan:Wait()local au='Unknown'if an[at
.UserInputType]~=nil then au=an[at.UserInputType]elseif at.UserInputType==Enum.
UserInputType.Keyboard then au=at.KeyCode==Enum.KeyCode.Escape and'None'or at.
KeyCode.Name end al.Value=au al:Update()u:SafeCallback(al.ChangedCallback,at.
KeyCode==Enum.KeyCode.Unknown and at.UserInputType or at.KeyCode)u:SafeCallback(
al.Changed,at.KeyCode==Enum.KeyCode.Unknown and at.UserInputType or at.KeyCode)e
.RenderStepped:Wait()as=false end)ao.MouseButton2Click:Connect(aq.Toggle)u:
GiveSignal(g.InputBegan:Connect(function(at)if al.Mode=='Always'or al.Value==
'Unknown'or al.Value=='None'or as or g:GetFocusedTextBox()then return end if al.
Mode=='Toggle'then local au=al.Value if an[at.UserInputType]==au then al.Toggled
=not al.Toggled al:DoClick()elseif at.UserInputType==Enum.UserInputType.Keyboard
and at.KeyCode.Name==au then al.Toggled=not al.Toggled al:DoClick()end end al:
Update()end))u:GiveSignal(g.InputEnded:Connect(function()if al.Value=='Unknown'
or al.Value=='None'or as or g:GetFocusedTextBox()then return end al:Update()end)
)al:Update()if aj.Addons then table.insert(aj.Addons,al)end t[Z]=al return Y end
local aj={}for ak=0,1,0.1 do table.insert(aj,ColorSequenceKeypoint.new(ak,Color3
.fromHSV(ak,1,1)))end function ai.AddColorPicker(ak,al,am)am=u:Validate(am,w.
ColorPicker)local an=ak local ao=an.TextLabel local ap={Value=am.Default,
Transparency=am.Transparency or 0,Callback=am.Callback,Changed=am.Changed,Type=
'ColorPicker'}ap.Hue,ap.Sat,ap.Vib=ap.Value:ToHSV()local aq=P('TextButton',{
BackgroundColor3=ap.Value,BorderColor3=u:GetDarkerColor(ap.Value),
BorderSizePixel=1,Size=UDim2.fromOffset(18,18),Text='',Parent=ao})local ar=P(
'ImageLabel',{Image=v.GetAsset'TransparencyTexture',ImageTransparency=(1-ap.
Transparency),ScaleType=Enum.ScaleType.Tile,Size=UDim2.fromScale(1,1),TileSize=
UDim2.fromOffset(9,9),Parent=aq})local as=u:AddContextMenu(aq,UDim2.fromOffset(
am.Transparency and 256 or 234,0),function()return{0.5,aq.AbsoluteSize.Y+1.5}end
,1)as.List.Padding=UDim.new(0,8)ap.ColorMenu=as P('UIPadding',{PaddingBottom=
UDim.new(0,6),PaddingLeft=UDim.new(0,6),PaddingRight=UDim.new(0,6),PaddingTop=
UDim.new(0,6),Parent=as.Menu})if typeof(am.Title)=='string'then P('TextLabel',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,8),Text=am.Title,TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,Parent=as.Menu})end local at=P('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,200),Parent=as.Menu})P(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6
),Parent=at})local au=P('ImageButton',{BackgroundColor3=ap.Value,Image=v.
GetAsset'SaturationMap',Size=UDim2.fromOffset(200,200),Parent=at})local av=P(
'Frame',{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3='White',Size=UDim2.
fromOffset(6,6),Parent=au})P('UICorner',{CornerRadius=UDim.new(1,0),Parent=av})
P('UIStroke',{Color='Dark',Parent=av})local aw=P('TextButton',{Size=UDim2.
fromOffset(16,200),Text='',Parent=at})P('UIGradient',{Color=ColorSequence.new(aj
),Rotation=90,Parent=aw})local ax=P('Frame',{AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3='White',BorderColor3='Dark',BorderSizePixel=1,Position=UDim2.
fromScale(0.5,ap.Hue),Size=UDim2.new(1,2,0,1),Parent=aw})local ay,Y,Z if am.
Transparency then ay=P('ImageButton',{Image=v.GetAsset'TransparencyTexture',
ScaleType=Enum.ScaleType.Tile,Size=UDim2.fromOffset(16,200),TileSize=UDim2.
fromOffset(8,8),Parent=at})Y=P('Frame',{BackgroundColor3=ap.Value,Size=UDim2.
fromScale(1,1),Parent=ay})P('UIGradient',{Rotation=90,Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,
1)},Parent=Y})Z=P('Frame',{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=
'White',BorderColor3='Dark',BorderSizePixel=1,Position=UDim2.fromScale(0.5,ap.
Transparency),Size=UDim2.new(1,2,0,1),Parent=ay})end local _=P('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,20),Parent=as.Menu})P(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,HorizontalFlex=Enum.
UIFlexAlignment.Fill,Padding=UDim.new(0,8),Parent=_})local az=P('TextBox',{
BackgroundColor3='MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,
ClearTextOnFocus=false,Size=UDim2.fromScale(1,1),Text='#??????',TextSize=14,
Parent=_})local aA=P('TextBox',{BackgroundColor3='MainColor',BorderColor3=
'OutlineColor',BorderSizePixel=1,ClearTextOnFocus=false,Size=UDim2.fromScale(1,1
),Text='?, ?, ?',TextSize=14,Parent=_})local aB=u:AddContextMenu(aq,UDim2.
fromOffset(93,0),function()return{aq.AbsoluteSize.X+1.5,0.5}end,1)ap.ContextMenu
=aB do local aC=function(aC,aD)local aE=P('TextButton',{BackgroundTransparency=1
,Size=UDim2.new(1,0,0,21),Text=aC,TextSize=14,Parent=aB.Menu})aE.
MouseButton1Click:Connect(function()u:SafeCallback(aD)aB:Close()end)end aC(
'Copy color',function()u.CopiedColor={ap.Value,ap.Transparency}end)aC(
'Paste color',function()ap:SetValueRGB(u.CopiedColor[1],u.CopiedColor[2])end)if
l then aC('Copy Hex',function()l(tostring(ap.Value:ToHex()))end)aC('Copy RGB',
function()l(table.concat({math.floor(ap.Value.R*255),math.floor(ap.Value.G*255),
math.floor(ap.Value.B*255)},', '))end)end end function ap.SetHSVFromRGB(aC,aD)ap
.Hue,ap.Sat,ap.Vib=aD:ToHSV()end function ap.Display(aC)if u.Unloaded then
return end ap.Value=Color3.fromHSV(ap.Hue,ap.Sat,ap.Vib)aq.BackgroundColor3=ap.
Value aq.BorderColor3=u:GetDarkerColor(ap.Value)ar.ImageTransparency=(1-ap.
Transparency)au.BackgroundColor3=Color3.fromHSV(ap.Hue,1,1)if Y then Y.
BackgroundColor3=ap.Value end av.Position=UDim2.fromScale(ap.Sat,1-ap.Vib)ax.
Position=UDim2.fromScale(0.5,ap.Hue)if Z then Z.Position=UDim2.fromScale(0.5,ap.
Transparency)end az.Text='#'..ap.Value:ToHex()aA.Text=table.concat({math.floor(
ap.Value.R*255),math.floor(ap.Value.G*255),math.floor(ap.Value.B*255)},', ')end
function ap.Update(aC)ap:Display()u:SafeCallback(ap.Callback,ap.Value)u:
SafeCallback(ap.Changed,ap.Value)end function ap.OnChanged(aC,aD)ap.Changed=aD
end function ap.SetValue(aC,aD,aE)local aF=Color3.fromHSV(aD[1],aD[2],aD[3])ap.
Transparency=am.Transparency and aE or 0 ap:SetHSVFromRGB(aF)ap:Update()end
function ap.SetValueRGB(aC,aD,aE)ap.Transparency=am.Transparency and aE or 0 ap:
SetHSVFromRGB(aD)ap:Update()end aq.MouseButton1Click:Connect(as.Toggle)aq.
MouseButton2Click:Connect(aB.Toggle)au.InputBegan:Connect(function(aC)while D(aC
)do local aD=au.AbsolutePosition.X local aE=aD+au.AbsoluteSize.X local aF=math.
clamp(p.X,aD,aE)local aG=au.AbsolutePosition.Y local aH=aG+au.AbsoluteSize.Y
local aI=math.clamp(p.Y,aG,aH)local aJ=ap.Sat local aK=ap.Vib ap.Sat=(aF-aD)/(aE
-aD)ap.Vib=1-((aI-aG)/(aH-aG))if ap.Sat~=aJ or ap.Vib~=aK then ap:Update()end e.
RenderStepped:Wait()end end)aw.InputBegan:Connect(function(aC)while D(aC)do
local aD=aw.AbsolutePosition.Y local aE=aD+aw.AbsoluteSize.Y local aF=math.
clamp(p.Y,aD,aE)local aG=ap.Hue ap.Hue=(aF-aD)/(aE-aD)if ap.Hue~=aG then ap:
Update()end e.RenderStepped:Wait()end end)if ay then ay.InputBegan:Connect(
function(aC)while D(aC)do local aD=ay.AbsolutePosition.Y local aE=ay.
AbsolutePosition.Y+ay.AbsoluteSize.Y local aF=math.clamp(p.Y,aD,aE)local aG=ap.
Transparency ap.Transparency=(aF-aD)/(aE-aD)if ap.Transparency~=aG then ap:
Update()end e.RenderStepped:Wait()end end)end az.FocusLost:Connect(function(aC)
if not aC then return end local aD,aE=pcall(Color3.fromHex,az.Text)if aD and
typeof(aE)=='Color3'then ap.Hue,ap.Sat,ap.Vib=aE:ToHSV()end ap:Update()end)aA.
FocusLost:Connect(function(aC)if not aC then return end local aD,aE,aF=aA.Text:
match'(%d+),%s*(%d+),%s*(%d+)'if aD and aE and aF then ap:SetHSVFromRGB(Color3.
fromRGB(aD,aE,aF))end ap:Update()end)ap:Display()if an.Addons then table.insert(
an.Addons,ap)end t[al]=ap return ak end ah.__index=ai ah.__namecall=function(ak,
al,...)return ai[al](...)end end local ai={}do local aj={}function aj.AddDivider
(ak)local al=ak local am=al.Container local an=P('Frame',{BackgroundColor3=
'MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,Size=UDim2.new(1,0,0,2
),Parent=am})al:Resize()table.insert(al.Elements,{Holder=an,Type='Divider'})end
function aj.AddLabel(ak,...)local al={}local am=select(1,...)local an=select(2,
...)if typeof(am)=='table'or typeof(an)=='table'then local ao=typeof(am)==
'table'and am or an al.Text=ao.Text or''al.DoesWrap=ao.DoesWrap or false al.Size
=ao.Size or 14 al.Visible=ao.Visible or true al.Idx=typeof(an)=='table'and am or
nil else al.Text=am or''al.DoesWrap=an or false al.Size=14 al.Visible=true al.
Idx=select(3,...)or nil end local ao=ak local ap=ao.Container local aq={Text=al.
Text,DoesWrap=al.DoesWrap,Visible=al.Visible,Type='Label'}local ar=P('TextLabel'
,{BackgroundTransparency=1,Size=UDim2.new(1,0,0,18),Text=aq.Text,TextSize=al.
Size,TextWrapped=aq.DoesWrap,TextXAlignment=ao.IsKeyTab and Enum.TextXAlignment.
Center or Enum.TextXAlignment.Left,Parent=ap})function aq.SetVisible(as,at)aq.
Visible=at ar.Visible=aq.Visible ao:Resize()end function aq.SetText(as,at)aq.
Text=at ar.Text=at if aq.DoesWrap then local au,av=u:GetTextBounds(aq.Text,ar.
FontFace,ar.TextSize,ar.AbsoluteSize.X)ar.Size=UDim2.new(1,0,0,av+4*u.DPIScale)
end ao:Resize()end if aq.DoesWrap then local as,at=u:GetTextBounds(aq.Text,ar.
FontFace,ar.TextSize,ar.AbsoluteSize.X)ar.Size=UDim2.new(1,0,0,at+4*u.DPIScale)
else P('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
HorizontalAlignment=Enum.HorizontalAlignment.Right,Padding=UDim.new(0,6),Parent=
ar})end if al.DoesWrap then local as=ar.AbsoluteSize ar:GetPropertyChangedSignal
'AbsoluteSize':Connect(function()if ar.AbsoluteSize==as then return end local at
,au=u:GetTextBounds(aq.Text,ar.FontFace,ar.TextSize,ar.AbsoluteSize.X)ar.Size=
UDim2.new(1,0,0,au+4*u.DPIScale)as=ar.AbsoluteSize ao:Resize()end)end ao:Resize(
)aq.TextLabel=ar aq.Container=ap if not al.DoesWrap then setmetatable(aq,ah)end
aq.Holder=ar table.insert(ao.Elements,aq)if al.Idx then q[al.Idx]=aq else table.
insert(q,aq)end return aq end function aj.AddButton(ak,...)local al=function(...
)local al={}local am=select(1,...)local an=select(2,...)if typeof(am)=='table'or
typeof(an)=='table'then local ao=typeof(am)=='table'and am or an al.Text=ao.Text
or''al.Func=ao.Func or function()end al.DoubleClick=ao.DoubleClick al.Tooltip=ao
.Tooltip al.DisabledTooltip=ao.DisabledTooltip al.Risky=ao.Risky or false al.
Disabled=ao.Disabled or false al.Visible=ao.Visible or true al.Idx=typeof(an)==
'table'and am or nil else al.Text=am or''al.Func=an or function()end al.
DoubleClick=false al.Tooltip=nil al.DisabledTooltip=nil al.Risky=false al.
Disabled=false al.Visible=true al.Idx=select(3,...)or nil end return al end
local am=al(...)local an=ak local ao=an.Container local ap={Text=am.Text,Func=am
.Func,DoubleClick=am.DoubleClick,Tooltip=am.Tooltip,DisabledTooltip=am.
DisabledTooltip,TooltipTable=nil,Risky=am.Risky,Disabled=am.Disabled,Visible=am.
Visible,Tween=nil,Type='Button'}local aq=P('Frame',{BackgroundTransparency=1,
Size=UDim2.new(1,0,0,21),Parent=ao})P('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,HorizontalFlex=Enum.UIFlexAlignment.Fill,Padding=UDim.
new(0,9),Parent=aq})local ar=function(ar)local as=P('TextButton',{Active=not ar.
Disabled,BackgroundColor3=ar.Disabled and'BackgroundColor'or'MainColor',Size=
UDim2.fromScale(1,1),Text=ar.Text,TextSize=14,TextTransparency=0.4,Visible=ar.
Visible,Parent=aq})local at=P('UIStroke',{Color='OutlineColor',Transparency=ar.
Disabled and 0.5 or 0,Parent=as})return as,at end local as=function(as)as.Base.
MouseEnter:Connect(function()if as.Disabled then return end as.Tween=j:Create(as
.Base,u.TweenInfo,{TextTransparency=0})as.Tween:Play()end)as.Base.MouseLeave:
Connect(function()if as.Disabled then return end as.Tween=j:Create(as.Base,u.
TweenInfo,{TextTransparency=0.4})as.Tween:Play()end)as.Base.MouseButton1Click:
Connect(function()if as.Disabled or as.Locked then return end if as.DoubleClick
then as.Locked=true as.Base.Text='Are you sure?'as.Base.TextColor3=u.Scheme.
AccentColor u.Registry[as.Base].TextColor3='AccentColor'local at=B(as.Base.
MouseButton1Click,0.5)as.Base.Text=as.Text as.Base.TextColor3=as.Risky and u.
Scheme.Red or u.Scheme.FontColor u.Registry[as.Base].TextColor3=as.Risky and
'Red'or'FontColor'if at then u:SafeCallback(as.Func)end e.RenderStepped:Wait()as
.Locked=false return end u:SafeCallback(as.Func)end)end ap.Base,ap.Stroke=ar(ap)
as(ap)function ap.AddButton(at,...)local au=al(...)local av={Text=au.Text,Func=
au.Func,DoubleClick=au.DoubleClick,Tooltip=au.Tooltip,DisabledTooltip=au.
DisabledTooltip,TooltipTable=nil,Risky=au.Risky,Disabled=au.Disabled,Visible=au.
Visible,Tween=nil,Type='SubButton'}ap.SubButton=av av.Base,av.Stroke=ar(av)as(av
)function av.UpdateColors(aw)if u.Unloaded then return end G(av.Tween)av.Base.
BackgroundColor3=av.Disabled and u.Scheme.BackgroundColor or u.Scheme.MainColor
av.Base.TextTransparency=av.Disabled and 0.8 or 0.4 av.Stroke.Transparency=av.
Disabled and 0.5 or 0 u.Registry[av.Base].BackgroundColor3=av.Disabled and
'BackgroundColor'or'MainColor'end function av.SetDisabled(aw,ax)av.Disabled=ax
if av.TooltipTable then av.TooltipTable.Disabled=av.Disabled end av.Base.Active=
not av.Disabled av:UpdateColors()end function av.SetVisible(aw,ax)av.Visible=ax
av.Base.Visible=av.Visible an:Resize()end function av.SetText(aw,ax)av.Text=ax
av.Base.Text=ax end if typeof(av.Tooltip)=='string'or typeof(av.DisabledTooltip)
=='string'then av.TooltipTable=u:AddTooltip(av.Tooltip,av.DisabledTooltip,av.
Base)av.TooltipTable.Disabled=av.Disabled end if av.Risky then av.Base.
TextColor3=u.Scheme.Red u.Registry[av.Base].TextColor3='Red'end av:UpdateColors(
)if au.Idx then r[au.Idx]=av else table.insert(r,av)end return av end function
ap.UpdateColors(at)if u.Unloaded then return end G(ap.Tween)ap.Base.
BackgroundColor3=ap.Disabled and u.Scheme.BackgroundColor or u.Scheme.MainColor
ap.Base.TextTransparency=ap.Disabled and 0.8 or 0.4 ap.Stroke.Transparency=ap.
Disabled and 0.5 or 0 u.Registry[ap.Base].BackgroundColor3=ap.Disabled and
'BackgroundColor'or'MainColor'end function ap.SetDisabled(at,au)ap.Disabled=au
if ap.TooltipTable then ap.TooltipTable.Disabled=ap.Disabled end ap.Base.Active=
not ap.Disabled ap:UpdateColors()end function ap.SetVisible(at,au)ap.Visible=au
aq.Visible=ap.Visible an:Resize()end function ap.SetText(at,au)ap.Text=au ap.
Base.Text=au end if typeof(ap.Tooltip)=='string'or typeof(ap.DisabledTooltip)==
'string'then ap.TooltipTable=u:AddTooltip(ap.Tooltip,ap.DisabledTooltip,ap.Base)
ap.TooltipTable.Disabled=ap.Disabled end if ap.Risky then ap.Base.TextColor3=u.
Scheme.Red u.Registry[ap.Base].TextColor3='Red'end ap:UpdateColors()an:Resize()
ap.Holder=aq table.insert(an.Elements,ap)if am.Idx then r[am.Idx]=ap else table.
insert(r,ap)end return ap end function aj.AddCheckbox(ak,al,am)am=u:Validate(am,
w.Toggle)local an=ak local ao=an.Container local ap={Text=am.Text,Value=am.
Default,Tooltip=am.Tooltip,DisabledTooltip=am.DisabledTooltip,TooltipTable=nil,
Callback=am.Callback,Changed=am.Changed,Risky=am.Risky,Disabled=am.Disabled,
Visible=am.Visible,Addons={},Type='Toggle'}local aq=P('TextButton',{Active=not
ap.Disabled,BackgroundTransparency=1,Size=UDim2.new(1,0,0,18),Text='',Visible=ap
.Visible,Parent=ao})local ar=P('TextLabel',{BackgroundTransparency=1,Position=
UDim2.fromOffset(26,0),Size=UDim2.new(1,-26,1,0),Text=ap.Text,TextSize=14,
TextTransparency=0.4,TextXAlignment=Enum.TextXAlignment.Left,Parent=aq})P(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=
Enum.HorizontalAlignment.Right,Padding=UDim.new(0,6),Parent=ar})local as=P(
'Frame',{BackgroundColor3='MainColor',Size=UDim2.fromScale(1,1),SizeConstraint=
Enum.SizeConstraint.RelativeYY,Parent=aq})P('UICorner',{CornerRadius=UDim.new(0,
u.CornerRadius/2),Parent=as})local at=P('UIStroke',{Color='OutlineColor',Parent=
as})local au=P('ImageLabel',{Image=ad and ad.Url or'',ImageColor3='FontColor',
ImageRectOffset=ad and ad.ImageRectOffset or Vector2.zero,ImageRectSize=ad and
ad.ImageRectSize or Vector2.zero,ImageTransparency=1,Position=UDim2.fromOffset(2
,2),Size=UDim2.new(1,-4,1,-4),Parent=as})function ap.UpdateColors(av)ap:Display(
)end function ap.Display(av)if u.Unloaded then return end at.Transparency=ap.
Disabled and 0.5 or 0 if ap.Disabled then ar.TextTransparency=0.8 au.
ImageTransparency=ap.Value and 0.8 or 1 as.BackgroundColor3=u.Scheme.
BackgroundColor u.Registry[as].BackgroundColor3='BackgroundColor'return end j:
Create(ar,u.TweenInfo,{TextTransparency=ap.Value and 0 or 0.4}):Play()j:Create(
au,u.TweenInfo,{ImageTransparency=ap.Value and 0 or 1}):Play()as.
BackgroundColor3=u.Scheme.MainColor u.Registry[as].BackgroundColor3='MainColor'
end function ap.OnChanged(av,aw)ap.Changed=aw end function ap.SetValue(av,aw)if
ap.Disabled then return end ap.Value=aw ap:Display()for ax,ay in pairs(ap.Addons
)do if ay.Type=='KeyPicker'and ay.SyncToggleState then ay.Toggled=ap.Value ay:
Update()end end u:SafeCallback(ap.Callback,ap.Value)u:SafeCallback(ap.Changed,ap
.Value)u:UpdateDependencyBoxes()end function ap.SetDisabled(av,aw)ap.Disabled=aw
if ap.TooltipTable then ap.TooltipTable.Disabled=ap.Disabled end for ax,ay in
pairs(ap.Addons)do if ay.Type=='KeyPicker'and ay.SyncToggleState then ay:Update(
)end end aq.Active=not ap.Disabled ap:Display()end function ap.SetVisible(av,aw)
ap.Visible=aw aq.Visible=ap.Visible an:Resize()end function ap.SetText(av,aw)ap.
Text=aw ar.Text=aw end aq.MouseButton1Click:Connect(function()if ap.Disabled
then return end ap:SetValue(not ap.Value)end)if typeof(ap.Tooltip)=='string'or
typeof(ap.DisabledTooltip)=='string'then ap.TooltipTable=u:AddTooltip(ap.Tooltip
,ap.DisabledTooltip,aq)ap.TooltipTable.Disabled=ap.Disabled end if ap.Risky then
ar.TextColor3=u.Scheme.Red u.Registry[ar].TextColor3='Red'end ap:Display()an:
Resize()ap.TextLabel=ar ap.Container=ao setmetatable(ap,ah)ap.Holder=aq table.
insert(an.Elements,ap)s[al]=ap return ap end function aj.AddToggle(ak,al,am)if u
.ForceCheckbox then return aj.AddCheckbox(ak,al,am)end am=u:Validate(am,w.Toggle
)local an=ak local ao=an.Container local ap={Text=am.Text,Value=am.Default,
Tooltip=am.Tooltip,DisabledTooltip=am.DisabledTooltip,TooltipTable=nil,Callback=
am.Callback,Changed=am.Changed,Risky=am.Risky,Disabled=am.Disabled,Visible=am.
Visible,Addons={},Type='Toggle'}local aq=P('TextButton',{Active=not ap.Disabled,
BackgroundTransparency=1,Size=UDim2.new(1,0,0,18),Text='',Visible=ap.Visible,
Parent=ao})local ar=P('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,-40
,1,0),Text=ap.Text,TextSize=14,TextTransparency=0.4,TextXAlignment=Enum.
TextXAlignment.Left,Parent=aq})P('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.Right,
Padding=UDim.new(0,6),Parent=ar})local as=P('Frame',{AnchorPoint=Vector2.new(1,0
),BackgroundColor3='MainColor',Position=UDim2.fromScale(1,0),Size=UDim2.
fromOffset(32,18),Parent=aq})P('UICorner',{CornerRadius=UDim.new(1,0),Parent=as}
)P('UIPadding',{PaddingBottom=UDim.new(0,2),PaddingLeft=UDim.new(0,2),
PaddingRight=UDim.new(0,2),PaddingTop=UDim.new(0,2),Parent=as})local at=P(
'UIStroke',{Color='OutlineColor',Parent=as})local au=P('Frame',{BackgroundColor3
='FontColor',Size=UDim2.fromScale(1,1),SizeConstraint=Enum.SizeConstraint.
RelativeYY,Parent=as})P('UICorner',{CornerRadius=UDim.new(1,0),Parent=au})
function ap.UpdateColors(av)ap:Display()end function ap.Display(av)if u.Unloaded
then return end local aw=ap.Value and 1 or 0 as.BackgroundTransparency=ap.
Disabled and 0.75 or 0 at.Transparency=ap.Disabled and 0.75 or 0 as.
BackgroundColor3=ap.Value and u.Scheme.AccentColor or u.Scheme.MainColor at.
Color=ap.Value and u.Scheme.AccentColor or u.Scheme.OutlineColor u.Registry[as].
BackgroundColor3=ap.Value and'AccentColor'or'MainColor'u.Registry[at].Color=ap.
Value and'AccentColor'or'OutlineColor'if ap.Disabled then ar.TextTransparency=
0.8 au.AnchorPoint=Vector2.new(aw,0)au.Position=UDim2.fromScale(aw,0)au.
BackgroundColor3=u:GetDarkerColor(u.Scheme.FontColor)u.Registry[au].
BackgroundColor3=function()return u:GetDarkerColor(u.Scheme.FontColor)end return
end j:Create(ar,u.TweenInfo,{TextTransparency=ap.Value and 0 or 0.4}):Play()j:
Create(au,u.TweenInfo,{AnchorPoint=Vector2.new(aw,0),Position=UDim2.fromScale(aw
,0)}):Play()au.BackgroundColor3=u.Scheme.FontColor u.Registry[au].
BackgroundColor3='FontColor'end function ap.OnChanged(av,aw)ap.Changed=aw end
function ap.SetValue(av,aw)if ap.Disabled then return end ap.Value=aw ap:
Display()for ax,ay in pairs(ap.Addons)do if ay.Type=='KeyPicker'and ay.
SyncToggleState then ay.Toggled=ap.Value ay:Update()end end u:SafeCallback(ap.
Callback,ap.Value)u:SafeCallback(ap.Changed,ap.Value)u:UpdateDependencyBoxes()
end function ap.SetDisabled(av,aw)ap.Disabled=aw if ap.TooltipTable then ap.
TooltipTable.Disabled=ap.Disabled end for ax,ay in pairs(ap.Addons)do if ay.Type
=='KeyPicker'and ay.SyncToggleState then ay:Update()end end aq.Active=not ap.
Disabled ap:Display()end function ap.SetVisible(av,aw)ap.Visible=aw aq.Visible=
ap.Visible an:Resize()end function ap.SetText(av,aw)ap.Text=aw ar.Text=aw end aq
.MouseButton1Click:Connect(function()if ap.Disabled then return end ap:SetValue(
not ap.Value)end)if typeof(ap.Tooltip)=='string'or typeof(ap.DisabledTooltip)==
'string'then ap.TooltipTable=u:AddTooltip(ap.Tooltip,ap.DisabledTooltip,aq)ap.
TooltipTable.Disabled=ap.Disabled end if ap.Risky then ar.TextColor3=u.Scheme.
Red u.Registry[ar].TextColor3='Red'end ap:Display()an:Resize()ap.TextLabel=ar ap
.Container=ao setmetatable(ap,ah)ap.Holder=aq table.insert(an.Elements,ap)s[al]=
ap return ap end function aj.AddInput(ak,al,am)am=u:Validate(am,w.Input)local an
=ak local ao=an.Container local ap={Text=am.Text,Value=am.Default,Finished=am.
Finished,Numeric=am.Numeric,ClearTextOnFocus=am.ClearTextOnFocus,Placeholder=am.
Placeholder,AllowEmpty=am.AllowEmpty,EmptyReset=am.EmptyReset,Tooltip=am.Tooltip
,DisabledTooltip=am.DisabledTooltip,TooltipTable=nil,Callback=am.Callback,
Changed=am.Changed,Disabled=am.Disabled,Visible=am.Visible,Type='Input'}local aq
=P('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,39),Visible=ap.Visible
,Parent=ao})local ar=P('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,0,
0,14),Text=ap.Text,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,Parent=aq
})local as=P('TextBox',{AnchorPoint=Vector2.new(0,1),BackgroundColor3=
'MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,ClearTextOnFocus=not
ap.Disabled and ap.ClearTextOnFocus,PlaceholderText=ap.Placeholder,Position=
UDim2.fromScale(0,1),Size=UDim2.new(1,0,0,21),Text=ap.Value,TextEditable=not ap.
Disabled,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,Parent=aq})P(
'UIPadding',{PaddingBottom=UDim.new(0,3),PaddingLeft=UDim.new(0,8),PaddingRight=
UDim.new(0,8),PaddingTop=UDim.new(0,4),Parent=as})function ap.UpdateColors(at)if
u.Unloaded then return end ar.TextTransparency=ap.Disabled and 0.8 or 0 as.
TextTransparency=ap.Disabled and 0.8 or 0 end function ap.OnChanged(at,au)ap.
Changed=au end function ap.SetValue(at,au)if not ap.AllowEmpty and I(au)==''then
au=ap.EmptyReset end if am.MaxLength and#au>am.MaxLength then au=au:sub(1,am.
MaxLength)end if ap.Numeric then if#au>0 and not tonumber(au)then au=ap.Value
end end ap.Value=au as.Text=au if not ap.Disabled then u:SafeCallback(ap.
Callback,ap.Value)u:SafeCallback(ap.Changed,ap.Value)end end function ap.
SetDisabled(at,au)ap.Disabled=au if ap.TooltipTable then ap.TooltipTable.
Disabled=ap.Disabled end as.ClearTextOnFocus=not ap.Disabled and ap.
ClearTextOnFocus as.TextEditable=not ap.Disabled ap:UpdateColors()end function
ap.SetVisible(at,au)ap.Visible=au aq.Visible=ap.Visible an:Resize()end function
ap.SetText(at,au)ap.Text=au ar.Text=au end if ap.Finished then as.FocusLost:
Connect(function(at)if not at then return end ap:SetValue(as.Text)end)else as:
GetPropertyChangedSignal'Text':Connect(function()ap:SetValue(as.Text)end)end if
typeof(ap.Tooltip)=='string'or typeof(ap.DisabledTooltip)=='string'then ap.
TooltipTable=u:AddTooltip(ap.Tooltip,ap.DisabledTooltip,as)ap.TooltipTable.
Disabled=ap.Disabled end an:Resize()ap.Holder=aq table.insert(an.Elements,ap)t[
al]=ap return ap end function aj.AddSlider(ak,al,am)am=u:Validate(am,w.Slider)
local an=ak local ao=an.Container local ap={Text=am.Text,Value=am.Default,Min=am
.Min,Max=am.Max,Prefix=am.Prefix,Suffix=am.Suffix,Tooltip=am.Tooltip,
DisabledTooltip=am.DisabledTooltip,TooltipTable=nil,Callback=am.Callback,Changed
=am.Changed,Disabled=am.Disabled,Visible=am.Visible,Type='Slider'}local aq=P(
'Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,am.Compact and 13 or 31),
Visible=ap.Visible,Parent=ao})local ar if not am.Compact then ar=P('TextLabel',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,14),Text=ap.Text,TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,Parent=aq})end local as=P('TextButton',{
Active=not ap.Disabled,AnchorPoint=Vector2.new(0,1),BackgroundColor3='MainColor'
,BorderColor3='OutlineColor',BorderSizePixel=1,Position=UDim2.fromScale(0,1),
Size=UDim2.new(1,0,0,13),Text='',Parent=aq})local at=P('TextLabel',{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextSize=14,ZIndex=2,
Parent=as})P('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual,Color=
'Dark',LineJoinMode=Enum.LineJoinMode.Miter,Parent=at})local au=P('Frame',{
BackgroundColor3='AccentColor',Size=UDim2.fromScale(0.5,1),Parent=as,DPIExclude=
{Size=true}})function ap.UpdateColors(av)if u.Unloaded then return end if ar
then ar.TextTransparency=ap.Disabled and 0.8 or 0 end at.TextTransparency=ap.
Disabled and 0.8 or 0 au.BackgroundColor3=ap.Disabled and u.Scheme.OutlineColor
or u.Scheme.AccentColor u.Registry[au].BackgroundColor3=ap.Disabled and
'OutlineColor'or'AccentColor'end function ap.Display(av)if u.Unloaded then
return end if am.Compact then at.Text=string.format('%s: %s%s%s',ap.Text,ap.
Prefix,ap.Value,ap.Suffix)elseif am.HideMax then at.Text=string.format('%s%s%s',
ap.Prefix,ap.Value,ap.Suffix)else at.Text=string.format('%s%s%s/%s%s%s',ap.
Prefix,ap.Value,ap.Suffix,ap.Prefix,ap.Max,ap.Suffix)end local aw=(ap.Value-ap.
Min)/(ap.Max-ap.Min)au.Size=UDim2.fromScale(aw,1)end function ap.OnChanged(av,aw
)ap.Changed=aw end function ap.SetMax(av,aw)local ax=aw>ap.Min ap.Value=math.
clamp(ap.Value,ap.Min,aw)ap.Max=aw ap:Display()end function ap.SetMin(av,aw)
local ax=aw<ap.Max ap.Value=math.clamp(ap.Value,aw,ap.Max)ap.Min=aw ap:Display()
end function ap.SetValue(av,aw)if ap.Disabled then return end local ax=tonumber(
aw)if not ax then return end ax=math.clamp(ax,ap.Min,ap.Max)ap.Value=ax ap:
Display()u:SafeCallback(ap.Callback,ap.Value)u:SafeCallback(ap.Changed,ap.Value)
end function ap.SetDisabled(av,aw)ap.Disabled=aw if ap.TooltipTable then ap.
TooltipTable.Disabled=ap.Disabled end as.Active=not ap.Disabled ap:UpdateColors(
)end function ap.SetVisible(av,aw)ap.Visible=aw aq.Visible=ap.Visible an:Resize(
)end function ap.SetText(av,aw)ap.Text=aw if ar then ar.Text=aw return end ap:
Display()end function ap.SetPrefix(av,aw)ap.Prefix=aw ap:Display()end function
ap.SetSuffix(av,aw)ap.Suffix=aw ap:Display()end as.InputBegan:Connect(function(
av)if not D(av)or ap.Disabled then return end for aw,ax in pairs(u.ActiveTab.
Sides)do ax.ScrollingEnabled=false end while D(av)do local aw=p.X local ax=math.
clamp((aw-as.AbsolutePosition.X)/as.AbsoluteSize.X,0,1)local ay=ap.Value ap.
Value=J(ap.Min+((ap.Max-ap.Min)*ax),am.Rounding)ap:Display()if ap.Value~=ay then
u:SafeCallback(ap.Callback,ap.Value)u:SafeCallback(ap.Changed,ap.Value)end e.
RenderStepped:Wait()end for aw,ax in pairs(u.ActiveTab.Sides)do ax.
ScrollingEnabled=true end end)if typeof(ap.Tooltip)=='string'or typeof(ap.
DisabledTooltip)=='string'then ap.TooltipTable=u:AddTooltip(ap.Tooltip,ap.
DisabledTooltip,as)ap.TooltipTable.Disabled=ap.Disabled end ap:UpdateColors()ap:
Display()an:Resize()ap.Holder=aq table.insert(an.Elements,ap)t[al]=ap return ap
end function aj.AddDropdown(ak,al,am)am=u:Validate(am,w.Dropdown)local an=ak
local ao=an.Container if am.SpecialType=='Player'then am.Values=K(am.
ExcludeLocalPlayer)am.AllowNull=true elseif am.SpecialType=='Team'then am.Values
=L()am.AllowNull=true end local ap={Text=typeof(am.Text)=='string'and am.Text or
nil,Value=am.Multi and{}or nil,Values=am.Values,DisabledValues=am.DisabledValues
,SpecialType=am.SpecialType,ExcludeLocalPlayer=am.ExcludeLocalPlayer,Tooltip=am.
Tooltip,DisabledTooltip=am.DisabledTooltip,TooltipTable=nil,Callback=am.Callback
,Changed=am.Changed,Disabled=am.Disabled,Visible=am.Visible,Type='Dropdown'}
local aq=P('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,ap.Text and 39
or 21),Visible=ap.Visible,Parent=ao})local ar=P('TextLabel',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,14),Text=ap.Text,TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,Visible=not not am.Text,Parent=aq})local
as=P('TextButton',{Active=not ap.Disabled,AnchorPoint=Vector2.new(0,1),
BackgroundColor3='MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,
Position=UDim2.fromScale(0,1),Size=UDim2.new(1,0,0,21),Text='---',TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,Parent=aq})P('UIPadding',{PaddingLeft=
UDim.new(0,8),PaddingRight=UDim.new(0,4),Parent=as})local at=P('ImageLabel',{
AnchorPoint=Vector2.new(1,0.5),Image=ae and ae.Url or'',ImageColor3='FontColor',
ImageRectOffset=ae and ae.ImageRectOffset or Vector2.zero,ImageRectSize=ae and
ae.ImageRectSize or Vector2.zero,ImageTransparency=0.5,Position=UDim2.fromScale(
1,0.5),Size=UDim2.fromOffset(16,16),Parent=as})local au if am.Searchable then au
=P('TextBox',{BackgroundTransparency=1,PlaceholderText='Search...',Position=
UDim2.fromOffset(-8,0),Size=UDim2.new(1,-12,1,0),TextSize=14,TextXAlignment=Enum
.TextXAlignment.Left,Visible=false,Parent=as})P('UIPadding',{PaddingLeft=UDim.
new(0,8),Parent=au})end local av=u:AddContextMenu(as,function()return UDim2.
fromOffset(as.AbsoluteSize.X,0)end,function()return{0.5,as.AbsoluteSize.Y+1.5}
end,2,function(av)as.TextTransparency=(av and au)and 1 or 0 at.ImageTransparency
=av and 0 or 0.5 at.Rotation=av and 180 or 0 if au then au.Text=''au.Visible=av
end end)ap.Menu=av u:UpdateDPI(av.Menu,{Position=false,Size=false})function ap.
RecalculateListSize(aw,ax)local ay=math.clamp((ax or F(ap.Values))*(21*u.
DPIScale),0,am.MaxVisibleDropdownItems*(21*u.DPIScale))av:SetSize(function()
return UDim2.fromOffset(as.AbsoluteSize.X,ay)end)end function ap.UpdateColors(aw
)if u.Unloaded then return end ar.TextTransparency=ap.Disabled and 0.8 or 0 as.
TextTransparency=ap.Disabled and 0.8 or 0 at.ImageTransparency=ap.Disabled and
0.8 or av.Active and 0 or 0.5 end function ap.Display(aw)if u.Unloaded then
return end local ax=''if am.Multi then for ay,az in pairs(ap.Values)do if ap.
Value[az]then ax=ax..(am.FormatDisplayValue and tostring(am.FormatDisplayValue(
az))or tostring(az))..', 'end end ax=ax:sub(1,#ax-2)else ax=ap.Value and
tostring(ap.Value)or''if ax~=''and am.FormatDisplayValue then ax=tostring(am.
FormatDisplayValue(ax))end end if#ax>25 then ax=ax:sub(1,22)..'...'end as.Text=(
ax==''and'---'or ax)end function ap.OnChanged(aw,ax)ap.Changed=ax end function
ap.GetActiveValues(aw)if am.Multi then local ax={}for ay,az in pairs(ap.Value)do
table.insert(ax,ay)end return ax end return ap.Value and 1 or 0 end local aw={}
function ap.BuildDropdownList(ax)local ay=ap.Values local az=ap.DisabledValues
for aA,aB in pairs(aw)do aA:Destroy()end table.clear(aw)local aA=0 for aB,aC in
pairs(ay)do if au and not tostring(aC):lower():match(au.Text:lower())then
continue end aA=aA+1 local aD=table.find(az,aC)local aE={}local aF=P(
'TextButton',{BackgroundColor3='MainColor',BackgroundTransparency=1,LayoutOrder=
aD and 1 or 0,Size=UDim2.new(1,0,0,21),Text=tostring(aC),TextSize=14,
TextTransparency=0.5,TextXAlignment=Enum.TextXAlignment.Left,Parent=av.Menu})P(
'UIPadding',{PaddingLeft=UDim.new(0,7),PaddingRight=UDim.new(0,7),Parent=aF})
local aG if am.Multi then aG=ap.Value[aC]else aG=ap.Value==aC end function aE.
UpdateButton(aH)if am.Multi then aG=ap.Value[aC]else aG=ap.Value==aC end aF.
BackgroundTransparency=aG and 0 or 1 aF.TextTransparency=aD and 0.8 or aG and 0
or 0.5 end if not aD then aF.MouseButton1Click:Connect(function()local aH=not aG
if not(ap:GetActiveValues()==1 and not aH and not am.AllowNull)then aG=aH if am.
Multi then ap.Value[aC]=aG and true or nil else ap.Value=aG and aC or nil end
for aI,aJ in pairs(aw)do aJ:UpdateButton()end end aE:UpdateButton()ap:Display()u
:SafeCallback(ap.Callback,ap.Value)u:SafeCallback(ap.Changed,ap.Value)u:
UpdateDependencyBoxes()end)end aE:UpdateButton()ap:Display()aw[aF]=aE end ap:
RecalculateListSize(aA)end function ap.SetValue(ax,ay)if am.Multi then local az=
{}for aA,aB in pairs(ay or{})do if aB and table.find(ap.Values,aA)then az[aA]=
true end end ap.Value=az else if table.find(ap.Values,ay)then ap.Value=ay elseif
not ay then ap.Value=nil end end ap:Display()for az,aA in pairs(aw)do aA:
UpdateButton()end if not ap.Disabled then u:SafeCallback(ap.Callback,ap.Value)u:
SafeCallback(ap.Changed,ap.Value)u:UpdateDependencyBoxes()end end function ap.
SetValues(ax,ay)ap.Values=ay ap:BuildDropdownList()end function ap.AddValues(ax,
ay)if typeof(ay)=='table'then for az,aA in pairs(ay)do table.insert(ap.Values,aA
)end elseif typeof(ay)=='string'then table.insert(ap.Values,ay)else return end
ap:BuildDropdownList()end function ap.SetDisabledValues(ax,ay)ap.DisabledValues=
ay ap:BuildDropdownList()end function ap.AddDisabledValues(ax,ay)if typeof(ay)==
'table'then for az,aA in pairs(ay)do table.insert(ap.DisabledValues,aA)end
elseif typeof(ay)=='string'then table.insert(ap.DisabledValues,ay)else return
end ap:BuildDropdownList()end function ap.SetDisabled(ax,ay)ap.Disabled=ay if ap
.TooltipTable then ap.TooltipTable.Disabled=ap.Disabled end av:Close()as.Active=
not ap.Disabled ap:UpdateColors()end function ap.SetVisible(ax,ay)ap.Visible=ay
aq.Visible=ap.Visible an:Resize()end function ap.SetText(ax,ay)ap.Text=ay aq.
Size=UDim2.new(1,0,0,(ay and 39 or 21)*u.DPIScale)ar.Text=ay and ay or''ar.
Visible=not not ay end as.MouseButton1Click:Connect(function()if ap.Disabled
then return end av:Toggle()end)if au then au:GetPropertyChangedSignal'Text':
Connect(ap.BuildDropdownList)end local ax={}if typeof(am.Default)=='string'then
local ay=table.find(ap.Values,am.Default)if ay then table.insert(ax,ay)end
elseif typeof(am.Default)=='table'then for ay,az in next,am.Default do local aA=
table.find(ap.Values,az)if aA then table.insert(ax,aA)end end elseif ap.Values[
am.Default]~=nil then table.insert(ax,am.Default)end if next(ax)then for ay=1,#
ax do local az=ax[ay]if am.Multi then ap.Value[ap.Values[az] ]=true else ap.
Value=ap.Values[az]end if not am.Multi then break end end end if typeof(ap.
Tooltip)=='string'or typeof(ap.DisabledTooltip)=='string'then ap.TooltipTable=u:
AddTooltip(ap.Tooltip,ap.DisabledTooltip,as)ap.TooltipTable.Disabled=ap.Disabled
end ap:UpdateColors()ap:Display()ap:BuildDropdownList()an:Resize()ap.Holder=aq
table.insert(an.Elements,ap)t[al]=ap return ap end function aj.AddViewport(ak,al
,am)am=u:Validate(am,w.Viewport)local an=ak local ao=an.Container local ap,aq=
false,false local ar,as=0 local at={Object=(am.Clone and{(am.Object:Clone())}or{
(am.Object)})[1],Camera=(not am.Camera and{(Instance.new'Camera')}or{(am.Camera)
})[1],Interactive=am.Interactive,AutoFocus=am.AutoFocus,Visible=am.Visible,Type=
'Viewport'}local au=typeof(at.Object)=='Instance'and(at.Object:IsA'BasePart'or
at.Object:IsA'Model')local av=typeof(at.Camera)=='Instance'and at.Camera:IsA
'Camera'local aw=function(aw)if aw:IsA'BasePart'then return aw.Size end return
select(2,aw:GetBoundingBox())end local ax=function()local ax=aw(at.Object)local
ay=math.max(ax.X,ax.Y,ax.Z)local az=ay*2 local aA=at.Object:GetPivot().Position
at.Camera.CFrame=CFrame.new(aA+Vector3.new(0,ay/2,az),aA)end local ay=P('Frame',
{BackgroundTransparency=1,Size=UDim2.new(1,0,0,am.Height),Visible=at.Visible,
Parent=ao})local az=P('Frame',{AnchorPoint=Vector2.new(0,1),BackgroundColor3=
'MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,Position=UDim2.
fromScale(0,1),Size=UDim2.fromScale(1,1),Parent=ay})P('UIPadding',{PaddingBottom
=UDim.new(0,3),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),PaddingTop=
UDim.new(0,4),Parent=az})local aA=P('ViewportFrame',{BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),Parent=az,CurrentCamera=at.Camera,Active=at.
Interactive})aA.MouseEnter:Connect(function()if not at.Interactive then return
end for aB,aC in pairs(an.Tab.Sides)do aC.ScrollingEnabled=false end end)aA.
MouseLeave:Connect(function()if not at.Interactive then return end for aB,aC in
pairs(an.Tab.Sides)do aC.ScrollingEnabled=true end end)aA.InputBegan:Connect(
function(aB)if not at.Interactive then return end if aB.UserInputType==Enum.
UserInputType.MouseButton2 then ap=true as=aB.Position elseif aB.UserInputType==
Enum.UserInputType.Touch and not aq then ap=true as=aB.Position end end)u:
GiveSignal(g.InputEnded:Connect(function(aB)if not at.Interactive then return
end if aB.UserInputType==Enum.UserInputType.MouseButton2 then ap=false elseif aB
.UserInputType==Enum.UserInputType.Touch then ap=false end end))u:GiveSignal(g.
InputChanged:Connect(function(aB)if not at.Interactive or not ap or aq then
return end if aB.UserInputType==Enum.UserInputType.MouseMovement or aB.
UserInputType==Enum.UserInputType.Touch then local aC=aB.Position-as as=aB.
Position local aD=at.Object:GetPivot().Position local aE=at.Camera local aF=
CFrame.fromAxisAngle(Vector3.new(0,1,0),-aC.X*0.01)aE.CFrame=CFrame.new(aD)*aF*
CFrame.new(-aD)*aE.CFrame local aG=CFrame.fromAxisAngle(aE.CFrame.RightVector,-
aC.Y*0.01)local aH=CFrame.new(aD)*aG*CFrame.new(-aD)*aE.CFrame if aH.UpVector.Y>
0.1 then aE.CFrame=aH end end end))aA.InputChanged:Connect(function(aB)if not at
.Interactive then return end if aB.UserInputType==Enum.UserInputType.MouseWheel
then local aC=aB.Position.Z*2 do local aD=at.Camera aD.CFrame=aD.CFrame+at.
Camera.CFrame.LookVector*aC end end end)u:GiveSignal(g.TouchPinch:Connect(
function(aB,aC,aD,aE)if not at.Interactive or not u:MouseIsOverFrame(aA,aB[1])
then return end if aE==Enum.UserInputState.Begin then aq=true ap=false ar=(aB[1]
-aB[2]).Magnitude elseif aE==Enum.UserInputState.Change then local aF=(aB[1]-aB[
2]).Magnitude local aG=(aF-ar)*0.1 ar=aF do local aH=at.Camera aH.CFrame=aH.
CFrame+at.Camera.CFrame.LookVector*aG end elseif aE==Enum.UserInputState.End or
aE==Enum.UserInputState.Cancel then aq=false end end))at.Object.Parent=aA if at.
AutoFocus then ax()end function at.SetObject(aB,aC,aD)if aD then aC=aC:Clone()
end if at.Object then at.Object:Destroy()end at.Object=aC at.Object.Parent=aA an
:Resize()end function at.SetHeight(aB,aC)local aD=aC>0 ay.Size=UDim2.new(1,0,0,
aC)an:Resize()end function at.Focus(aB)if not at.Object then return end ax()end
function at.SetCamera(aB,aC)local aD=aC and typeof(aC)=='Instance'and aC:IsA
'Camera'at.Camera=aC aA.CurrentCamera=aC end function at.SetInteractive(aB,aC)at
.Interactive=aC aA.Active=aC end function at.SetVisible(aB,aC)at.Visible=aC ay.
Visible=at.Visible an:Resize()end an:Resize()at.Holder=ay table.insert(an.
Elements,at)t[al]=at return at end function aj.AddImage(ak,al,am)am=u:Validate(
am,w.Image)local an=ak local ao=an.Container local ap={Image=am.Image,Color=am.
Color,RectOffset=am.RectOffset,RectSize=am.RectSize,Height=am.Height,ScaleType=
am.ScaleType,Transparency=am.Transparency,Visible=am.Visible,Type='Image'}local
aq=P('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,am.Height),Visible=
ap.Visible,Parent=ao})local ar=P('Frame',{AnchorPoint=Vector2.new(0,1),
BackgroundColor3='MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,
Position=UDim2.fromScale(0,1),Size=UDim2.fromScale(1,1),Parent=aq})P('UIPadding'
,{PaddingBottom=UDim.new(0,3),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,
8),PaddingTop=UDim.new(0,4),Parent=ar})local as={BackgroundTransparency=1,Size=
UDim2.fromScale(1,1),Image=ap.Image,ImageTransparency=ap.Transparency,
ImageColor3=ap.Color,ImageRectOffset=ap.RectOffset,ImageRectSize=ap.RectSize,
ScaleType=ap.ScaleType,Parent=ar}if not(as.Image:match'rbxasset'or as.Image:
match'roblox%.com/asset/%?id='or as.Image:match'rbxthumb://type=AvatarHeadShot')
then local at=u:GetIcon(as.Image)as.Image=at.Url as.ImageRectOffset=at.
ImageRectOffset as.ImageRectSize=at.ImageRectSize end local at=P('ImageLabel',as
)function ap.SetHeight(av,aw)local ax=aw>0 ap.Height=aw aq.Size=UDim2.new(1,0,0,
aw)an:Resize()end function ap.SetImage(av,aw)local ax=typeof(aw)=='string'if not
(aw:match'rbxasset'or aw:match'roblox%.com/asset/%?id='or aw:match
'rbxthumb://type=AvatarHeadShot')then local ay=u:GetIcon(aw)aw=ay.Url ap.
RectOffset=ay.ImageRectOffset ap.RectSize=ay.ImageRectSize end at.Image=aw ap.
Image=aw end function ap.SetColor(av,aw)local ax=typeof(aw)=='Color3'at.
ImageColor3=aw ap.Color=aw end function ap.SetRectOffset(av,aw)local ax=typeof(
aw)=='Vector2'at.ImageRectOffset=aw ap.RectOffset=aw end function ap.SetRectSize
(av,aw)local ax=typeof(aw)=='Vector2'at.ImageRectSize=aw ap.RectSize=aw end
function ap.SetScaleType(av,aw)local ax=typeof(aw)=='EnumItem'and aw:IsA
'ScaleType'at.ScaleType=aw ap.ScaleType=aw end function ap.SetTransparency(av,aw
)local ax=typeof(aw)=='number'local ay=aw>=0 and aw<=1 at.ImageTransparency=aw
ap.Transparency=aw end function ap.SetVisible(av,aw)ap.Visible=aw aq.Visible=ap.
Visible an:Resize()end an:Resize()ap.Holder=aq table.insert(an.Elements,ap)t[al]
=ap return ap end function aj.AddDependencyBox(ak)local al=ak local am=al.
Container local an local ao do an=P('Frame',{BackgroundTransparency=1,Size=UDim2
.fromScale(1,1),Visible=false,Parent=am})ao=P('UIListLayout',{Padding=UDim.new(0
,8),Parent=an})end local ap={Visible=false,Dependencies={},Holder=an,Container=
an,Elements={},DependencyBoxes={}}function ap.Resize(aq)an.Size=UDim2.new(1,0,0,
ao.AbsoluteContentSize.Y*u.DPIScale)al:Resize()end function ap.Update(aq,ar)for
as,at in pairs(ap.Dependencies)do local av=at[1]local aw=at[2]if av.Type==
'Toggle'and av.Value~=aw then an.Visible=false ap.Visible=false return elseif av
.Type=='Dropdown'then if typeof(av.Value)=='table'then if not av.Value[aw]then
an.Visible=false ap.Visible=false return end else if av.Value~=aw then an.
Visible=false ap.Visible=false return end end end end ap.Visible=true an.Visible
=true if not u.Searching then ap:Resize()elseif not ar then u:UpdateSearch(u.
SearchText)end end function ap.SetupDependencies(aq,ar)for as,at in pairs(ar)do
local av=typeof(at)=='table'local aw=at[1]~=nil local ay=at[2]~=nil end ap.
Dependencies=ar ap:Update()end an:GetPropertyChangedSignal'Visible':Connect(
function()ap:Resize()end)setmetatable(ap,ai)table.insert(al.DependencyBoxes,ap)
table.insert(u.DependencyBoxes,ap)return ap end function aj.
AddDependencyGroupbox(ak)local al=ak local am=al.Tab local an=al.BoxHolder local
ao=u:MakeOutline(an,u.CornerRadius)ao.Size=UDim2.fromScale(1,0)ao.Visible=false
u:UpdateDPI(ao,{Size=false})local ap local aq do ap=P('Frame',{BackgroundColor3=
'BackgroundColor',Position=UDim2.fromOffset(2,2),Size=UDim2.new(1,-4,1,-4),
Parent=ao})P('UICorner',{CornerRadius=UDim.new(0,u.CornerRadius-1),Parent=ap})aq
=P('UIListLayout',{Padding=UDim.new(0,8),Parent=ap})P('UIPadding',{PaddingBottom
=UDim.new(0,7),PaddingLeft=UDim.new(0,7),PaddingRight=UDim.new(0,7),PaddingTop=
UDim.new(0,7),Parent=ap})end local ar={Visible=false,Dependencies={},BoxHolder=
an,Holder=ao,Container=ap,Tab=am,Elements={},DependencyBoxes={}}function ar.
Resize(as)ao.Size=UDim2.new(1,0,0,aq.AbsoluteContentSize.Y+18*u.DPIScale)end
function ar.Update(as,at)for ay,az in pairs(ar.Dependencies)do local aA=az[1]
local aB=az[2]if aA.Type=='Toggle'and aA.Value~=aB then ao.Visible=false ar.
Visible=false return elseif aA.Type=='Dropdown'then if typeof(aA.Value)=='table'
then if not aA.Value[aB]then ao.Visible=false ar.Visible=false return end else
if aA.Value~=aB then ao.Visible=false ar.Visible=false return end end end end ar
.Visible=true if not u.Searching then ao.Visible=true ar:Resize()elseif not at
then u:UpdateSearch(u.SearchText)end end function ar.SetupDependencies(as,at)for
ay,az in pairs(at)do local aA=typeof(az)=='table'local aB=az[1]~=nil local aC=az
[2]~=nil end ar.Dependencies=at ar:Update()end setmetatable(ar,ai)table.insert(
am.DependencyGroupboxes,ar)table.insert(u.DependencyBoxes,ar)return ar end ai.
__index=aj ai.__namecall=function(ak,al,...)return aj[al](...)end end function u
.SetFont(aj,ak)if typeof(ak)=='EnumItem'then ak=Font.fromEnum(ak)end u.Scheme.
Font=ak u:UpdateColorsUsingRegistry()end function u.SetNotifySide(aj,ak)u.
NotifySide=ak if ak:lower()=='left'then W.AnchorPoint=Vector2.new(0,0)W.Position
=UDim2.fromOffset(6,6)X.HorizontalAlignment=Enum.HorizontalAlignment.Left else W
.AnchorPoint=Vector2.new(1,0)W.Position=UDim2.new(1,-6,0,6)X.HorizontalAlignment
=Enum.HorizontalAlignment.Right end end function u.Notify(aj,...)local ak={}
local al=select(1,...)if typeof(al)=='table'then ak.Title=tostring(al.Title)ak.
Description=tostring(al.Description)ak.Time=al.Time or 5 ak.SoundId=al.SoundId
ak.Steps=al.Steps ak.Persist=al.Persist else ak.Description=tostring(al)ak.Time=
select(2,...)or 5 ak.SoundId=select(3,...)end ak.Destroyed=false local am=false
local an if typeof(ak.Time)=='Instance'then an=ak.Time.Destroying:Connect(
function()am=true an:Disconnect()an=nil end)end local ao=P('Frame',{
AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Size=UDim2.
fromScale(1,0),Visible=false,Parent=W,DPIExclude={Size=true}})local ap=u:
MakeOutline(ao,u.CornerRadius,5)ap.AutomaticSize=Enum.AutomaticSize.Y ap.
Position=u.NotifySide:lower()=='left'and UDim2.new(-1,-6,0,-2)or UDim2.new(1,6,0
,-2)ap.Size=UDim2.fromScale(1,0)u:UpdateDPI(ap,{Position=false,Size=false})local
aq=P('Frame',{BackgroundColor3='MainColor',Position=UDim2.fromOffset(2,2),Size=
UDim2.new(1,-4,1,-4),Parent=ap})P('UICorner',{CornerRadius=UDim.new(0,u.
CornerRadius-1),Parent=aq})P('UIListLayout',{Padding=UDim.new(0,4),Parent=aq})P(
'UIPadding',{PaddingBottom=UDim.new(0,8),PaddingLeft=UDim.new(0,8),PaddingRight=
UDim.new(0,8),PaddingTop=UDim.new(0,8),Parent=aq})local ar local as local at=0
local ay=0 local az if ak.Title then ar=P('TextLabel',{BackgroundTransparency=1,
Text=ak.Title,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=
true,Parent=aq,DPIExclude={Size=true}})end if ak.Description then as=P(
'TextLabel',{BackgroundTransparency=1,Text=ak.Description,TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,Parent=aq,DPIExclude={
Size=true}})end function ak.Resize(aC)if ar then local aD,aE=u:GetTextBounds(ar.
Text,ar.FontFace,ar.TextSize,W.AbsoluteSize.X-(24*u.DPIScale))ar.Size=UDim2.
fromOffset(math.ceil(aD),aE)at=aD end if as then local aD,aE=u:GetTextBounds(as.
Text,as.FontFace,as.TextSize,W.AbsoluteSize.X-(24*u.DPIScale))as.Size=UDim2.
fromOffset(math.ceil(aD),aE)ay=aD end ao.Size=UDim2.fromOffset((at>ay and at or
ay)+(24*u.DPIScale),0)end function ak.ChangeTitle(aC,aD)if ar then ak.Title=
tostring(aD)ar.Text=ak.Title ak:Resize()end end function ak.ChangeDescription(aC
,aD)if as then ak.Description=tostring(aD)as.Text=ak.Description ak:Resize()end
end function ak.ChangeStep(aC,aD)if az and ak.Steps then aD=math.clamp(aD or 0,0
,ak.Steps)az.Size=UDim2.fromScale(aD/ak.Steps,1)end end function ak.Destroy(aC)
ak.Destroyed=true if an then an:Disconnect()end j:Create(ap,u.NotifyTweenInfo,{
Position=u.NotifySide:lower()=='left'and UDim2.new(-1,-6,0,-2)or UDim2.new(1,6,0
,-2)}):Play()task.delay(u.NotifyTweenInfo.Time,function()u.Notifications[ao]=nil
ao:Destroy()end)end ak:Resize()local aC=P('Frame',{BackgroundTransparency=1,Size
=UDim2.new(1,0,0,7),Visible=(ak.Persist~=true and typeof(ak.Time)~='Instance')or
typeof(ak.Steps)=='number',Parent=aq})local aD=P('Frame',{BackgroundColor3=
'BackgroundColor',BorderColor3='OutlineColor',BorderSizePixel=1,Position=UDim2.
fromOffset(0,3),Size=UDim2.new(1,0,0,2),Parent=aC})az=P('Frame',{
BackgroundColor3='AccentColor',Size=UDim2.fromScale(1,1),Parent=aD})if typeof(ak
.Time)=='Instance'then az.Size=UDim2.fromScale(0,1)end if ak.SoundId then local
aE=ak.SoundId if typeof(aE)=='number'then aE=string.format('rbxassetid://%s',
tostring(aE))end P('Sound',{SoundId=aE,Volume=3,PlayOnRemove=true,Parent=f}):
Destroy()end u.Notifications[ao]=ak ao.Visible=true j:Create(ap,u.
NotifyTweenInfo,{Position=UDim2.fromOffset(-2,-2)}):Play()task.delay(u.
NotifyTweenInfo.Time,function()if ak.Persist then return elseif typeof(ak.Time)
=='Instance'then repeat task.wait()until am or ak.Destroyed else j:Create(az,
TweenInfo.new(ak.Time,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{Size=
UDim2.fromScale(0,1)}):Play()task.wait(ak.Time)end if not ak.Destroyed then ak:
Destroy()end end)return ak end function u.CreateWindow(aj,ak)ak=u:Validate(ak,w.
Window)local al=workspace.CurrentCamera.ViewportSize if e:IsStudio()and al.X<=5
and al.Y<=5 then repeat al=workspace.CurrentCamera.ViewportSize task.wait()until
al.X>5 and al.Y>5 end local am=al.X-64 local an=al.Y-64 u.MinSize=Vector2.new(
math.min(u.MinSize.X,am),math.min(u.MinSize.Y,an))ak.Size=UDim2.fromOffset(math.
clamp(ak.Size.X.Offset,u.MinSize.X,am),math.clamp(ak.Size.Y.Offset,u.MinSize.Y,
an))if typeof(ak.Font)=='EnumItem'then ak.Font=Font.fromEnum(ak.Font)end u.
CornerRadius=ak.CornerRadius u:SetNotifySide(ak.NotifySide)u.ShowCustomCursor=ak
.ShowCustomCursor u.Scheme.Font=ak.Font u.ToggleKeybind=ak.ToggleKeybind local
ao local ap local aq local ar local as local at local ay local az do u.
KeybindFrame,u.KeybindContainer=u:AddDraggableMenu'Keybinds'u.KeybindFrame.
AnchorPoint=Vector2.new(0,0.5)u.KeybindFrame.Position=UDim2.new(0,6,0.5,0)u.
KeybindFrame.Visible=false u:UpdateDPI(u.KeybindFrame,{Position=false,Size=false
})ao=P('Frame',{BackgroundColor3=function()return u:GetBetterColor(u.Scheme.
BackgroundColor,-1)end,Name='Main',Position=ak.Position,Size=ak.Size,Visible=
false,Parent=S,DPIExclude={Position=true}})P('UICorner',{CornerRadius=UDim.new(0
,ak.CornerRadius-1),Parent=ao})do local aC={{Position=UDim2.fromOffset(0,48),
Size=UDim2.new(1,0,0,1)},{Position=UDim2.fromScale(0.3,0),Size=UDim2.new(0,1,1,-
21)},{AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,0,1,-20),Size=UDim2.new(
1,0,0,1)}}for aD,aE in pairs(aC)do u:MakeLine(ao,aE)end u:MakeOutline(ao,ak.
CornerRadius,0)end if ak.BackgroundImage then P('ImageLabel',{Image=ak.
BackgroundImage,Position=UDim2.fromScale(0,0),Size=UDim2.fromScale(1,1),
ScaleType=Enum.ScaleType.Stretch,ZIndex=999,BackgroundTransparency=1,
ImageTransparency=0.75,Parent=ao})end if ak.Center then ao.Position=UDim2.new(
0.5,-ao.Size.X.Offset/2,0.5,-ao.Size.Y.Offset/2)end local aC=P('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,48),Parent=ao})u:MakeDraggable(ao,
aC,false,true)local aD=P('Frame',{BackgroundTransparency=1,Size=UDim2.fromScale(
0.3,1),Parent=aC})P('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
HorizontalAlignment=Enum.HorizontalAlignment.Center,VerticalAlignment=Enum.
VerticalAlignment.Center,Padding=UDim.new(0,6),Parent=aD})if ak.Icon then P(
'ImageLabel',{Image=(tonumber(ak.Icon)and{(string.format('rbxassetid://%s',
tostring(ak.Icon)))}or{(ak.Icon)})[1],Size=ak.IconSize,Parent=aD})end local aE=u
:GetTextBounds(ak.Title,u.Scheme.Font,20,aD.AbsoluteSize.X-(ak.Icon and ak.
IconSize.X.Offset+6 or 0)-12)P('TextLabel',{BackgroundTransparency=1,Size=UDim2.
new(0,aE,1,0),Text=ak.Title,TextSize=20,Parent=aD})local aF=P('Frame',{
BackgroundTransparency=1,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0.3,8
,0.5,0),Size=UDim2.new(0.7,-57,1,-16),Parent=aC})P('UIListLayout',{FillDirection
=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.
Right,VerticalAlignment=Enum.VerticalAlignment.Center,Padding=UDim.new(0,8),
Parent=aF})aq=P('Frame',{Size=UDim2.fromScale(ak.DisableSearch and 1 or 0.5,1),
Visible=false,BackgroundTransparency=1,Parent=aF})P('UIListLayout',{
FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.
HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Center,Parent=
aq})P('UIPadding',{PaddingBottom=UDim.new(0,8),PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),PaddingTop=UDim.new(0,8),Parent=aq})ar=P('TextLabel',
{BackgroundTransparency=1,Size=UDim2.fromScale(1,0),AutomaticSize=Enum.
AutomaticSize.Y,Text='',TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,
Parent=aq})as=P('TextLabel',{BackgroundTransparency=1,Size=UDim2.fromScale(1,0),
AutomaticSize=Enum.AutomaticSize.Y,Text='',TextWrapped=true,TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0.5,Parent=aq})ap=P(
'TextBox',{BackgroundColor3='MainColor',PlaceholderText='Search',Size=UDim2.
fromScale(1,1),TextScaled=true,Visible=not(ak.DisableSearch or false),Parent=aF}
)P('UICorner',{CornerRadius=UDim.new(0,ak.CornerRadius),Parent=ap})P('UIPadding'
,{PaddingBottom=UDim.new(0,8),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,
8),PaddingTop=UDim.new(0,8),Parent=ap})P('UIStroke',{Color='OutlineColor',Parent
=ap})local aG=u:GetIcon'search'if aG then P('ImageLabel',{Image=aG.Url,
ImageColor3='FontColor',ImageRectOffset=aG.ImageRectOffset,ImageRectSize=aG.
ImageRectSize,ImageTransparency=0.5,Size=UDim2.fromScale(1,1),SizeConstraint=
Enum.SizeConstraint.RelativeYY,Parent=ap})end local aH=u:GetIcon'move'if aH then
P('ImageLabel',{AnchorPoint=Vector2.new(1,0.5),Image=aH.Url,ImageColor3=
'OutlineColor',ImageRectOffset=aH.ImageRectOffset,ImageRectSize=aH.ImageRectSize
,Position=UDim2.new(1,-10,0.5,0),Size=UDim2.fromOffset(28,28),SizeConstraint=
Enum.SizeConstraint.RelativeYY,Parent=aC})end local aI=P('Frame',{AnchorPoint=
Vector2.new(0,1),BackgroundColor3=function()return u:GetBetterColor(u.Scheme.
BackgroundColor,4)end,Position=UDim2.fromScale(0,1),Size=UDim2.new(1,0,0,20),
Parent=ao})do local aJ=u:MakeCover(aI,'Top')u:AddToRegistry(aJ,{BackgroundColor3
=function()return u:GetBetterColor(u.Scheme.BackgroundColor,4)end})end P(
'UICorner',{CornerRadius=UDim.new(0,ak.CornerRadius-1),Parent=aI})P('TextLabel',
{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text=ak.Footer,TextSize=14,
TextTransparency=0.5,Parent=aI})if ak.Resizable then at=P('TextButton',{
AnchorPoint=Vector2.new(1,0),BackgroundTransparency=1,Position=UDim2.fromScale(1
,0),Size=UDim2.fromScale(1,1),SizeConstraint=Enum.SizeConstraint.RelativeYY,Text
='',Parent=aI})u:MakeResizable(ao,at,function()for aJ,aK in pairs(u.Tabs)do aK:
Resize(true)end end)end P('ImageLabel',{Image=af and af.Url or'',ImageColor3=
'FontColor',ImageRectOffset=af and af.ImageRectOffset or Vector2.zero,
ImageRectSize=af and af.ImageRectSize or Vector2.zero,ImageTransparency=0.5,
Position=UDim2.fromOffset(2,2),Size=UDim2.new(1,-4,1,-4),Parent=at})ay=P(
'ScrollingFrame',{AutomaticCanvasSize=Enum.AutomaticSize.Y,BackgroundColor3=
'BackgroundColor',CanvasSize=UDim2.fromScale(0,0),Position=UDim2.fromOffset(0,49
),ScrollBarThickness=0,Size=UDim2.new(0.3,0,1,-70),Parent=ao})P('UIListLayout',{
Parent=ay})az=P('Frame',{AnchorPoint=Vector2.new(1,0),BackgroundColor3=function(
)return u:GetBetterColor(u.Scheme.BackgroundColor,1)end,Name='Container',
Position=UDim2.new(1,0,0,49),Size=UDim2.new(0.7,-1,1,-70),Parent=ao})P(
'UIPadding',{PaddingBottom=UDim.new(0,0),PaddingLeft=UDim.new(0,6),PaddingRight=
UDim.new(0,6),PaddingTop=UDim.new(0,0),Parent=az})end local aC={}function aC.
AddTab(aD,...)local aE local aF local aG if select('#',...)==1 and typeof(...)==
'table'then local aH=select(1,...)aE=aH.Name or'Tab'aF=aH.Icon aG=aH.Description
else aE=select(1,...)aF=select(2,...)aG=select(3,...)end local aH local aI local
aJ local aK local Y local Z local _ local aL local aM local aN local aO local aP
=false aF=u:GetIcon(aF)do aH=P('TextButton',{BackgroundColor3='MainColor',
BackgroundTransparency=1,Size=UDim2.new(1,0,0,40),Text='',Parent=ay})P(
'UIPadding',{PaddingBottom=UDim.new(0,11),PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),PaddingTop=UDim.new(0,11),Parent=aH})aI=P(
'TextLabel',{BackgroundTransparency=1,Position=UDim2.fromOffset(30,0),Size=UDim2
.new(1,-30,1,0),Text=aE,TextSize=16,TextTransparency=0.5,TextXAlignment=Enum.
TextXAlignment.Left,Parent=aH})if aF then aJ=P('ImageLabel',{Image=aF.Url,
ImageColor3='AccentColor',ImageRectOffset=aF.ImageRectOffset,ImageRectSize=aF.
ImageRectSize,ImageTransparency=0.5,Size=UDim2.fromScale(1,1),SizeConstraint=
Enum.SizeConstraint.RelativeYY,Parent=aH})end aK=P('Frame',{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Visible=false,Parent=az})Y=P(
'ScrollingFrame',{AutomaticCanvasSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,CanvasSize=UDim2.fromScale(0,0),ScrollBarThickness=0,
Parent=aK})P('UIListLayout',{Padding=UDim.new(0,6),Parent=Y})do P('Frame',{
BackgroundTransparency=1,LayoutOrder=-1,Parent=Y})P('Frame',{
BackgroundTransparency=1,LayoutOrder=1,Parent=Y})Y.Size=UDim2.new(0,math.floor(
aK.AbsoluteSize.X/2)-3,1,0)u:UpdateDPI(Y,{Size=Y.Size})end Z=P('ScrollingFrame',
{AnchorPoint=Vector2.new(1,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,CanvasSize=UDim2.fromScale(0,0),Position=UDim2.
fromScale(1,0),ScrollBarThickness=0,Parent=aK})P('UIListLayout',{Padding=UDim.
new(0,6),Parent=Z})do P('Frame',{BackgroundTransparency=1,LayoutOrder=-1,Parent=
Z})P('Frame',{BackgroundTransparency=1,LayoutOrder=1,Parent=Z})Z.Size=UDim2.new(
0,math.floor(aK.AbsoluteSize.X/2)-3,1,0)u:UpdateDPI(Z,{Size=Z.Size})end _=P(
'Frame',{AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=Color3.fromRGB(127,
0,0),BorderColor3=Color3.fromRGB(255,50,50),BorderMode=Enum.BorderMode.Inset,
BorderSizePixel=1,Position=UDim2.fromOffset(0,6),Size=UDim2.fromScale(1,0),
Visible=false,Parent=aK})aL=P('ScrollingFrame',{BackgroundTransparency=1,
BorderSizePixel=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,
-3),Size=UDim2.new(1,0,1,-3),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=
Enum.AutomaticSize.Y,ScrollBarThickness=3,Parent=_})P('UIPadding',{PaddingBottom
=UDim.new(0,4),PaddingLeft=UDim.new(0,6),PaddingRight=UDim.new(0,6),PaddingTop=
UDim.new(0,4),Parent=aL})aM=P('TextLabel',{BackgroundTransparency=1,Size=UDim2.
new(1,0,0,14),Text='',TextColor3=Color3.fromRGB(255,50,50),TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,Parent=aL})aO=P('UIStroke',{
ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual,Color=Color3.fromRGB(169,0,0),
LineJoinMode=Enum.LineJoinMode.Miter,Parent=aM})aN=P('TextLabel',{
BackgroundTransparency=1,Position=UDim2.fromOffset(0,16),Size=UDim2.new(1,0,1,-
14),Text='',TextSize=14,TextWrapped=true,Parent=aL,TextXAlignment=Enum.
TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top})P('UIStroke',{
ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual,Color='Dark',LineJoinMode=Enum.
LineJoinMode.Miter,Parent=aN})end local aQ={Groupboxes={},Tabboxes={},
DependencyGroupboxes={},Sides={Y,Z}}function aQ.UpdateWarningBox(aR,aS)if
typeof(aS.LockSize)=='boolean'then aP=aS.LockSize aQ:Resize(true)end if typeof(
aS.Visible)=='boolean'then _.Visible=aS.Visible aQ:Resize(true)end if typeof(aS.
Title)=='string'then aM.Text=aS.Title end if typeof(aS.Text)=='string'then local
aT,aU=u:GetTextBounds(aS.Text,u.Scheme.Font,aN.TextSize,aN.AbsoluteSize.X)aN.
Size=UDim2.new(1,0,0,aU)aN.Text=aS.Text u:UpdateDPI(aN,{Size=aN.Size})aQ:Resize(
true)end _.BackgroundColor3=aS.IsNormal==true and u.Scheme.BackgroundColor or
Color3.fromRGB(127,0,0)_.BorderColor3=aS.IsNormal==true and u.Scheme.
OutlineColor or Color3.fromRGB(255,50,50)aM.TextColor3=aS.IsNormal==true and u.
Scheme.FontColor or Color3.fromRGB(255,50,50)aO.Color=aS.IsNormal==true and u.
Scheme.OutlineColor or Color3.fromRGB(169,0,0)if not u.Registry[_]then u:
AddToRegistry(_,{})end if not u.Registry[aM]then u:AddToRegistry(aM,{})end if
not u.Registry[aO]then u:AddToRegistry(aO,{})end u.Registry[_].BackgroundColor3=
function()return aS.IsNormal==true and u.Scheme.BackgroundColor or Color3.
fromRGB(127,0,0)end u.Registry[_].BorderColor3=function()return aS.IsNormal==
true and u.Scheme.OutlineColor or Color3.fromRGB(255,50,50)end u.Registry[aM].
TextColor3=function()return aS.IsNormal==true and u.Scheme.FontColor or Color3.
fromRGB(255,50,50)end u.Registry[aO].Color=function()return aS.IsNormal==true
and u.Scheme.OutlineColor or Color3.fromRGB(169,0,0)end end function aQ.Resize(
aR,aS)if aS then local aT=math.floor(aK.AbsoluteSize.Y/3.25)local aU,aV=u:
GetTextBounds(aN.Text,u.Scheme.Font,aN.TextSize,aN.AbsoluteSize.X)if aP==true
and aV>=aT then aV=aT end _.Size=UDim2.new(1,0,0,aV)u:UpdateDPI(aN,{Size=_.Size}
)end local aT=_.Visible and _.AbsoluteSize.Y+6 or 0 for aU,aV in pairs(aQ.Sides)
do aV.Position=UDim2.new(aV.Position.X.Scale,0,0,aT)aV.Size=UDim2.new(0,math.
floor(aK.AbsoluteSize.X/2)-3,1,-aT)u:UpdateDPI(aV,{Position=aV.Position,Size=aV.
Size})end end function aQ.AddGroupbox(aR,aS)local aT=P('Frame',{AutomaticSize=
Enum.AutomaticSize.Y,BackgroundTransparency=1,Size=UDim2.fromScale(1,0),Parent=
aS.Side==1 and Y or Z})P('UIListLayout',{Padding=UDim.new(0,6),Parent=aT})local
aU=u:MakeOutline(aT,ak.CornerRadius)aU.Size=UDim2.fromScale(1,0)u:UpdateDPI(aU,{
Size=false})local aV local aW local aX local aY do aV=P('Frame',{
BackgroundColor3='BackgroundColor',Position=UDim2.fromOffset(2,2),Size=UDim2.
new(1,-4,1,-4),Parent=aU})P('UICorner',{CornerRadius=UDim.new(0,ak.CornerRadius-
1),Parent=aV})u:MakeLine(aV,{Position=UDim2.fromOffset(0,34),Size=UDim2.new(1,0,
0,1)})local aZ=u:GetIcon(aS.IconName)if aZ then P('ImageLabel',{Image=aZ.Url,
ImageColor3='AccentColor',ImageRectOffset=aZ.ImageRectOffset,ImageRectSize=aZ.
ImageRectSize,Position=UDim2.fromOffset(6,6),Size=UDim2.fromOffset(22,22),Parent
=aV})end aW=P('TextLabel',{BackgroundTransparency=1,Position=UDim2.fromOffset(aZ
and 24 or 0,0),Size=UDim2.new(1,0,0,34),Text=aS.Name,TextSize=15,TextXAlignment=
Enum.TextXAlignment.Left,Parent=aV})P('UIPadding',{PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),Parent=aW})aX=P('Frame',{BackgroundTransparency=1,
Position=UDim2.fromOffset(0,35),Size=UDim2.new(1,0,1,-35),Parent=aV})aY=P(
'UIListLayout',{Padding=UDim.new(0,8),Parent=aX})P('UIPadding',{PaddingBottom=
UDim.new(0,7),PaddingLeft=UDim.new(0,7),PaddingRight=UDim.new(0,7),PaddingTop=
UDim.new(0,7),Parent=aX})end local aZ={BoxHolder=aT,Holder=aU,Container=aX,Tab=
aQ,DependencyBoxes={},Elements={}}function aZ.Resize(a_)aU.Size=UDim2.new(1,0,0,
aY.AbsoluteContentSize.Y+53*u.DPIScale)end setmetatable(aZ,ai)aZ:Resize()aQ.
Groupboxes[aS.Name]=aZ return aZ end function aQ.AddLeftGroupbox(aR,aS,aT)return
aQ:AddGroupbox{Side=1,Name=aS,IconName=aT}end function aQ.AddRightGroupbox(aR,aS
,aT)return aQ:AddGroupbox{Side=2,Name=aS,IconName=aT}end function aQ.AddTabbox(
aR,aS)local aT=P('Frame',{AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,Size=UDim2.fromScale(1,0),Parent=aS.Side==1 and Y or Z}
)P('UIListLayout',{Padding=UDim.new(0,6),Parent=aT})local aU=u:MakeOutline(aT,ak
.CornerRadius)aU.Size=UDim2.fromScale(1,0)u:UpdateDPI(aU,{Size=false})local aV
local aW do aV=P('Frame',{BackgroundColor3='BackgroundColor',Position=UDim2.
fromOffset(2,2),Size=UDim2.new(1,-4,1,-4),Parent=aU})P('UICorner',{CornerRadius=
UDim.new(0,ak.CornerRadius-1),Parent=aV})aW=P('Frame',{BackgroundTransparency=1,
Size=UDim2.new(1,0,0,34),Parent=aV})P('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=aW})end
local aX={ActiveTab=nil,BoxHolder=aT,Holder=aU,Tabs={}}function aX.AddTab(aY,aZ)
local a_=P('TextButton',{BackgroundColor3='MainColor',BackgroundTransparency=0,
Size=UDim2.fromOffset(0,34),Text=aZ,TextSize=15,TextTransparency=0.5,Parent=aW})
local a0=u:MakeLine(a_,{AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,0,1,1)
,Size=UDim2.new(1,0,0,1)})local a1=P('Frame',{BackgroundTransparency=1,Position=
UDim2.fromOffset(0,35),Size=UDim2.new(1,0,1,-35),Visible=false,Parent=aV})local
a2=P('UIListLayout',{Padding=UDim.new(0,8),Parent=a1})P('UIPadding',{
PaddingBottom=UDim.new(0,7),PaddingLeft=UDim.new(0,7),PaddingRight=UDim.new(0,7)
,PaddingTop=UDim.new(0,7),Parent=a1})local a3={ButtonHolder=a_,Container=a1,Tab=
aQ,Elements={},DependencyBoxes={}}function a3.Show(a4)if aX.ActiveTab then aX.
ActiveTab:Hide()end a_.BackgroundTransparency=1 a_.TextTransparency=0 a0.Visible
=false a1.Visible=true aX.ActiveTab=a3 a3:Resize()end function a3.Hide(a4)a_.
BackgroundTransparency=0 a_.TextTransparency=0.5 a0.Visible=true a1.Visible=
false aX.ActiveTab=nil end function a3.Resize(a4)if aX.ActiveTab~=a3 then return
end aU.Size=UDim2.new(1,0,0,a2.AbsoluteContentSize.Y+53*u.DPIScale)end if not aX
.ActiveTab then a3:Show()end a_.MouseButton1Click:Connect(a3.Show)setmetatable(
a3,ai)aX.Tabs[aZ]=a3 return a3 end if aS.Name then aQ.Tabboxes[aS.Name]=aX else
table.insert(aQ.Tabboxes,aX)end return aX end function aQ.AddLeftTabbox(aR,aS)
return aQ:AddTabbox{Side=1,Name=aS}end function aQ.AddRightTabbox(aR,aS)return
aQ:AddTabbox{Side=2,Name=aS}end function aQ.Hover(aR,aS)if u.ActiveTab==aQ then
return end j:Create(aI,u.TweenInfo,{TextTransparency=aS and 0.25 or 0.5}):Play()
if aJ then j:Create(aJ,u.TweenInfo,{ImageTransparency=aS and 0.25 or 0.5}):Play(
)end end function aQ.Show(aR)if u.ActiveTab then u.ActiveTab:Hide()end j:Create(
aH,u.TweenInfo,{BackgroundTransparency=0}):Play()j:Create(aI,u.TweenInfo,{
TextTransparency=0}):Play()if aJ then j:Create(aJ,u.TweenInfo,{ImageTransparency
=0}):Play()end if aG then aq.Visible=true ap.Size=UDim2.fromScale(0.5,1)ar.Text=
aE as.Text=aG end aK.Visible=true u.ActiveTab=aQ end function aQ.Hide(aR)j:
Create(aH,u.TweenInfo,{BackgroundTransparency=1}):Play()j:Create(aI,u.TweenInfo,
{TextTransparency=0.5}):Play()if aJ then j:Create(aJ,u.TweenInfo,{
ImageTransparency=0.5}):Play()end aK.Visible=false ap.Size=UDim2.fromScale(1,1)
aq.Visible=false u.ActiveTab=nil end if not u.ActiveTab then aQ:Show()end aH.
MouseEnter:Connect(function()aQ:Hover(true)end)aH.MouseLeave:Connect(function()
aQ:Hover(false)end)aH.MouseButton1Click:Connect(aQ.Show)u.Tabs[aE]=aQ return aQ
end function aC.AddKeyTab(aD,aE)local aF local aG local aH local aI do aF=P(
'TextButton',{BackgroundColor3='MainColor',BackgroundTransparency=1,Size=UDim2.
new(1,0,0,40),Text='',Parent=ay})P('UIPadding',{PaddingBottom=UDim.new(0,11),
PaddingLeft=UDim.new(0,12),PaddingRight=UDim.new(0,12),PaddingTop=UDim.new(0,11)
,Parent=aF})aG=P('TextLabel',{BackgroundTransparency=1,Position=UDim2.
fromOffset(30,0),Size=UDim2.new(1,-30,1,0),Text=aE,TextSize=16,TextTransparency=
0.5,TextXAlignment=Enum.TextXAlignment.Left,Parent=aF})if ag then aH=P(
'ImageLabel',{Image=ag.Url,ImageColor3='AccentColor',ImageRectOffset=ag.
ImageRectOffset,ImageRectSize=ag.ImageRectSize,ImageTransparency=0.5,Size=UDim2.
fromScale(1,1),SizeConstraint=Enum.SizeConstraint.RelativeYY,Parent=aF})end aI=
P('ScrollingFrame',{AutomaticCanvasSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,CanvasSize=UDim2.fromScale(0,0),ScrollBarThickness=0,
Size=UDim2.fromScale(1,1),Visible=false,Parent=az})P('UIListLayout',{
HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=UDim.new(0,8),
VerticalAlignment=Enum.VerticalAlignment.Center,Parent=aI})P('UIPadding',{
PaddingLeft=UDim.new(0,1),PaddingRight=UDim.new(0,1),Parent=aI})end local aJ={
Elements={},IsKeyTab=true}function aJ.AddKeyBox(aK,...)local aL={}local aM=
select(1,...)if typeof(aM)=='function'then aL.Callback=aM else aL.ExpectedKey=aM
aL.Callback=select(2,...)end local aN=P('Frame',{BackgroundTransparency=1,Size=
UDim2.new(0.75,0,0,21),Parent=aI})local aO=P('TextBox',{BackgroundColor3=
'MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,PlaceholderText='Key',
Size=UDim2.new(1,-71,1,0),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,
Parent=aN})P('UIPadding',{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),
Parent=aO})local aP=P('TextButton',{AnchorPoint=Vector2.new(1,0),
BackgroundColor3='MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,
Position=UDim2.fromScale(1,0),Size=UDim2.new(0,63,1,0),Text='Execute',TextSize=
14,Parent=aN})aP.MouseButton1Click:Connect(function()if aL.ExpectedKey and aO.
Text~=aL.ExpectedKey then aL.Callback(false,aO.Text)return end aL.Callback(true,
aO.Text)end)end function aJ.Resize(aK)end function aJ.Hover(aK,aL)if u.ActiveTab
==aJ then return end j:Create(aG,u.TweenInfo,{TextTransparency=aL and 0.25 or
0.5}):Play()if aH then j:Create(aH,u.TweenInfo,{ImageTransparency=aL and 0.25 or
0.5}):Play()end end function aJ.Show(aK)if u.ActiveTab then u.ActiveTab:Hide()
end j:Create(aF,u.TweenInfo,{BackgroundTransparency=0}):Play()j:Create(aG,u.
TweenInfo,{TextTransparency=0}):Play()if aH then j:Create(aH,u.TweenInfo,{
ImageTransparency=0}):Play()end aI.Visible=true u.ActiveTab=aJ end function aJ.
Hide(aK)j:Create(aF,u.TweenInfo,{BackgroundTransparency=1}):Play()j:Create(aG,u.
TweenInfo,{TextTransparency=0.5}):Play()if aH then j:Create(aH,u.TweenInfo,{
ImageTransparency=0.5}):Play()end aI.Visible=false u.ActiveTab=nil end if not u.
ActiveTab then aJ:Show()end aF.MouseEnter:Connect(function()aJ:Hover(true)end)aF
.MouseLeave:Connect(function()aJ:Hover(false)end)aF.MouseButton1Click:Connect(aJ
.Show)aJ.Container=aI setmetatable(aJ,ai)u.Tabs[aE]=aJ return aJ end function u.
Toggle(aD,aE)if typeof(aE)=='boolean'then u.Toggled=aE else u.Toggled=not u.
Toggled end ao.Visible=u.Toggled U.Modal=u.Toggled if u.Toggled and not u.
IsMobile then local aF=g.MouseIconEnabled pcall(function()e:UnbindFromRenderStep
'ShowCursor'end)e:BindToRenderStep('ShowCursor',Enum.RenderPriority.Last.Value,
function()g.MouseIconEnabled=not u.ShowCustomCursor V.Position=UDim2.fromOffset(
p.X,p.Y)V.Visible=u.ShowCustomCursor if not(u.Toggled and S and S.Parent)then g.
MouseIconEnabled=aF V.Visible=false e:UnbindFromRenderStep'ShowCursor'end end)
elseif not u.Toggled then ab.Visible=false for aF,aG in pairs(u.Options)do if aG
.Type=='ColorPicker'then aG.ColorMenu:Close()aG.ContextMenu:Close()elseif aG.
Type=='Dropdown'or aG.Type=='KeyPicker'then aG.Menu:Close()end end end end if ak
.AutoShow then task.spawn(u.Toggle)end if u.IsMobile then local aD=u:
AddDraggableButton('Toggle',function()u:Toggle()end)local aE=u:
AddDraggableButton('Lock',function(aE)u.CantDragForced=not u.CantDragForced aE:
SetText(u.CantDragForced and'Unlock'or'Lock')end)if ak.MobileButtonsSide==
'Right'then aD.Button.Position=UDim2.new(1,-6,0,6)aD.Button.AnchorPoint=Vector2.
new(1,0)aE.Button.Position=UDim2.new(1,-6,0,46)aE.Button.AnchorPoint=Vector2.
new(1,0)else aE.Button.Position=UDim2.fromOffset(6,46)end end ap:
GetPropertyChangedSignal'Text':Connect(function()u:UpdateSearch(ap.Text)end)u:
GiveSignal(g.InputBegan:Connect(function(aD)if g:GetFocusedTextBox()then return
end if(typeof(u.ToggleKeybind)=='table'and u.ToggleKeybind.Type=='KeyPicker'and
aD.KeyCode.Name==u.ToggleKeybind.Value)or aD.KeyCode==u.ToggleKeybind then u.
Toggle()end end))u:GiveSignal(g.WindowFocused:Connect(function()u.
IsRobloxFocused=true end))u:GiveSignal(g.WindowFocusReleased:Connect(function()u
.IsRobloxFocused=false end))return aC end local aj=function()local aj,ak=K(),K(
true)for al,am in pairs(t)do if am.Type=='Dropdown'and am.SpecialType=='Player'
then am:SetValues(am.ExcludeLocalPlayer and ak or aj)end end end local ak=
function()local ak=L()for al,am in pairs(t)do if am.Type=='Dropdown'and am.
SpecialType=='Team'then am:SetValues(ak)end end end u:GiveSignal(d.PlayerAdded:
Connect(aj))u:GiveSignal(d.PlayerRemoving:Connect(aj))u:GiveSignal(i.ChildAdded:
Connect(ak))u:GiveSignal(i.ChildRemoved:Connect(ak))k().Library=u return u end
function a.c()local aa=a.load'b'return aa:CreateWindow{Title='My Script',Footer=
'v1.0.0',ToggleKeybind=Enum.KeyCode.RightControl,Center=true,AutoShow=true}end
function a.d()local aa=a.load'c'return{main=aa:AddTab('Main','house'),combat=aa:
AddTab('Combat','crosshair'),settings=aa:AddTab('Settings','settings')}end
function a.e()return game:GetService'Players'.LocalPlayer end function a.f()
local aa=a.load'e'return function()return aa.Character or aa.CharacterAdded:
Wait()end end function a.g()local aa={}aa.tycoonsFolder=(workspace:WaitForChild
'Tycoon':FindFirstChild'Tycoons')function aa.getTycoon(ab)return aa.
tycoonsFolder:FindFirstChild(ab)end function aa.getFloorOrigin(ab)local ac=aa.
getTycoon(ab)if not ac then return end if not ac:FindFirstChild'Floor'then
return end if not ac.Floor:FindFirstChild'FloorOrigin'then return end return ac.
Floor.FloorOrigin end return aa end function a.h()local aa=a.load'a'local ab=a.
load'f'local ac=a.load'e'local ad=a.load'd'local ae=a.load'g'local af=aa.new()
local ag=ad.main:AddRightGroupbox('Teleport','arrow-right-left')ag:AddButton(
'TeleportBase',{Text='Teleport to your base',Func=function()local ah=ab()local
ai=ae.getFloorOrigin(ac.Team.Name)ah:PivotTo(ai.CFrame)end})ag:AddButton(
'TeleportFlag',{Text='Teleport to capture point',Func=function()local ah=ab()
local ai=CFrame.new(-506,177,-1022)ah:PivotTo(ai)end})local ah=ag:AddDropdown(
'PlayersTeleportDropdown',{SpecialType='Player',Values={},Searchable=true,
Default=1,ExcludeLocalPlayer=true,Text='Select Player to Teleport'})ag:
AddButton('TeleportBase',{Text="Teleport to player's base",Func=function()local
ai=ah.Value local aj=ab()local ak=ae.getFloorOrigin(ai.Team.Name)aj:PivotTo(ak.
CFrame)end})return af end function a.i()local aa=game:GetService
'ReplicatedStorage'local ab=a.load'a'local ac=a.load'f'local ad=a.load'e'local
ae=a.load'd'local af=a.load'g'local ag=ab.new()local ah=ae.main:AddLeftGroupbox(
'Auto Crate/Oil','barrel')local ai local aj=aa.TankCrates.WeldCrate local ak={}
local al=1 local am=ah:AddDropdown('PlayersDropdown',{SpecialType='Player',
Values={},Searchable=true,Default=1,Text='Select Player to Teleport',Callback=
function()ak={}ai=nil end})local an=ah:AddToggle('AutoGiveToggle',{Text=
'Enable Auto Crate/Oil',Default=false,Tooltip=
'Give crates to the selected player'})ah:AddLabel{Text=
'You: Crates are automatically collected up.',DoesWrap=true}ah:AddLabel{Text=
'Others: Drop off crates at their oil/crate collector.',DoesWrap=true}local ao=
function(ao,ap)if not ao then return end ao.MaxActivationDistance=10
fireproximityprompt(ao)task.wait(0.2)if ap and aj then aj:InvokeServer(ap)end
end local function getCrates()if not an.Value then return{}end local ap={}local
aq=workspace:WaitForChild'Game Systems':WaitForChild'Crate Workspace'for ar,as
in pairs(aq:GetChildren())do if as:GetAttribute'Owner'==am.Value.Name then
continue end if ak[as]and am.Value~=ad then continue end table.insert(ap,as)end
if#ap==0 then local ar=af.tycoonsFolder:GetChildren()if al>#ar then al=1 else al
=al+1 end local as=ar[al]if as and as:FindFirstChild'Floor'then local at=ac()at:
PivotTo(as.Floor.FloorOrigin.CFrame)end task.wait(1)return getCrates()end return
ap end local ap=function(ap)local aq=ac()aq:PivotTo(ap.CFrame*CFrame.new(0,4,0))
ao(ap:FindFirstChild'StealPrompt',ap)ak[ap]=true task.wait(0.3)end local aq=
function(aq)local ar=ac()local as=am.Value.Team if not as then return end local
at=af.getTycoon(as.Name).Essentials['Oil Collector']if not ai then ar:PivotTo(af
.getTycoon(as.Name).Floor.FloorOrigin.CFrame)task.wait(1)if am.Value==ad then ai
=at:WaitForChild'Crate Collector'.Metal.CFrame*CFrame.new(0,5,0)else ai=at:
WaitForChild'Part'.CFrame*CFrame.new(0,5,0)end end if am.Value==ad then ar:
PivotTo(ai)task.wait(0.5)fireproximityprompt(at.CratePromptPart.SellPrompt)else
ar:PivotTo(ai)task.wait(0.5)aq.DropCrate:FireServer()end task.wait(0.5)end ag:
Add(task.spawn(function()while true do task.wait(0.1)if not an.Value then
continue end local ar=getCrates()for as,at in pairs(ar)do if not an.Value then
break end local ay,az=pcall(function()ap(at)aq(at)end)if not ay then warn(
'szar war tycoon script error :',az)end end end end))return ag end function a.j(
)local aa=a.load'a'local ab=a.load'f'local ac=a.load'e'local ad=a.load'd'local
ae=a.load'g'local af=aa.new()local ag=ad.main:AddLeftGroupbox('Auto Buy',
'circle-dollar-sign')local ah=ag:AddToggle('AutoBuyToggle',{Text=
'Enable Auto Buy',Default=false,Tooltip=
'Automatically buy available tycoon upgrades'})local ai=ag:AddCheckbox(
'SkipGamepass',{Text='Skip Gamepass Buttons',Default=true,Tooltip=
'Skip buttons that require gamepasses'})local aj=ag:AddCheckbox('SkipMission',{
Text='Skip Operations Buttons',Default=true,Tooltip=
'Skip buttons related to missions'})local ak=ag:AddCheckbox('SkipSpinner',{Text=
'Skip Spinner Rewards Buttons',Default=true,Tooltip='Skip spinner/wheel buttons'
})local al=ag:AddCheckbox('SkipReward',{Text='Skip Daily Reward Buttons',Default
=true,Tooltip='Skip reward-based buttons'})local am=ag:AddCheckbox(
'SkipClothing',{Text='Skip Clothing Buttons',Default=true,Tooltip=
'Skip clothing/cosmetic buttons'})local an=ag:AddCheckbox('SkipGroup',{Text=
'Skip Group Buttons',Default=true,Tooltip='Skip group-related buttons'})local ao
=ag:AddCheckbox('SkipMedalButton',{Text='Skip Medal Buttons',Default=true,
Tooltip='Skip medal/achievement buttons'})local ap=function()local ap=ab()if not
ap or not ac.Team then return end local aq=ae.getTycoon(ac.Team.Name)if not aq
then return end local ar=aq:FindFirstChild'UnpurchasedButtons'if not ar then
return end for as,at in pairs(ar:GetChildren())do if not ah.Value then break end
if at:GetAttribute'Gamepass'and ai.Value then continue end if at:FindFirstChild
'Mission'and aj.Value then continue end if at:GetAttribute'Spinner'and ak.Value
then continue end if at:GetAttribute'Reward'and al.Value then continue end if at
:GetAttribute'Clothing'and am.Value then continue end if at:GetAttribute'Group'
and an.Value then continue end if at:GetAttribute'MedalButton'and ao.Value then
continue end local ay=ac local az=at:GetAttribute'RebirthAmount'if az and ay.
leaderstats.Rebirths.Value<az then continue end if at:FindFirstChild'Part'then
ap:PivotTo(at.Part.CFrame*CFrame.new(0,7,0))firetouchinterest(ap.RightLeg,at.
Part,0)task.wait(0.1)firetouchinterest(ap.RightLeg,at.Part,1)end end end af:Add(
task.spawn(function()while true do task.wait(0.5)if ah.Value then local aq,ar=
pcall(ap)if not aq then warn('szar war tycoon script error :',ar)end end end end
))return af end end local aa=a.load'a'local ab=a.load'b'local ac=a.load'd'local
ad=aa.new()ad:Add(a.load'h')ad:Add(a.load'i')ad:Add(a.load'j')ac.settings:
AddLeftGroupbox'Script Control':AddButton('UnloadScript',{Text='Unload Script',
Tooltip='Completely stop and remove the script',Func=function()ad:Destroy()ab:
Unload()end})ab.ShowCustomCursor=false ab:Toggle(true)