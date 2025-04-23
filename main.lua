loadstring(game:HttpGet("https://raw.githubusercontent.com/ImaMeow/empyrean-in-a-loadstring/refs/heads/main/load.lua"))()

Empyrean = nil

DefaultFlingOptions = nil

Running = false

-- Gui to Lua
-- Version: 3.2

-- Instances:

local meowhook = Instance.new("ScreenGui")
local Mainframe = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local ImageLabel_2 = Instance.new("ImageLabel")
local StopReanimate = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local TextLabel_4 = Instance.new("TextLabel")
local RunReanimate = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local TextLabel_5 = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local AnimationMan = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local TextLabel_6 = Instance.new("TextLabel")

--Properties:

meowhook.Name = "meowhook"
meowhook.Parent = game.CoreGui
meowhook.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
meowhook.ResetOnSpawn = false

Mainframe.Name = "Mainframe"
Mainframe.Parent = meowhook
Mainframe.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Mainframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
Mainframe.BorderSizePixel = 0
Mainframe.Position = UDim2.new(0.345660388, 0, 0.208845213, 0)
Mainframe.Size = UDim2.new(0, 409, 0, 434)
Mainframe.Active = true
Mainframe.Draggable = true

TextLabel.Parent = Mainframe
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.00244498788, 0, 0.344036698, 0)
TextLabel.Size = UDim2.new(0, 409, 0, 22)
TextLabel.Font = Enum.Font.GothamMedium
TextLabel.Text = "Scripts"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 18.000
TextLabel.TextTransparency = 0.100

TextLabel_2.Parent = Mainframe
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(-0.00244498788, 0, 0.0963302776, 0)
TextLabel_2.Size = UDim2.new(0, 409, 0, 22)
TextLabel_2.Font = Enum.Font.GothamMedium
TextLabel_2.Text = "Reanimate"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 18.000
TextLabel_2.TextTransparency = 0.100

TextLabel_3.Parent = Mainframe
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(-0.0782396123, 0, 0, 0)
TextLabel_3.Size = UDim2.new(0, 409, 0, 22)
TextLabel_3.Font = Enum.Font.GothamMedium
TextLabel_3.Text = "meowhook V2 discord.gg/N4QHD7v2qE"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextSize = 19.000
TextLabel_3.TextTransparency = 0.100

ImageLabel.Parent = Mainframe
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(-0.156479225, 0, 0.18772459, 0)
ImageLabel.Size = UDim2.new(0, 293, 0, 454)
ImageLabel.ZIndex = -1
ImageLabel.Image = "rbxassetid://8992230677"
game:GetService("RunService").Heartbeat:Connect(function()
	rgb = tick() / 2 % 2
	ImageLabel.ImageColor3 = Color3.fromHSV(rgb,1,1)
end)

ImageLabel_2.Parent = Mainframe
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(-0.0802745149, 0, 0.291744471, 0)
ImageLabel_2.Size = UDim2.new(0, 329, 0, 347)
ImageLabel_2.ZIndex = 0
ImageLabel_2.Image = "rbxassetid://151807088"
ImageLabel_2.ScaleType = Enum.ScaleType.Fit

StopReanimate.Name = "Stop Reanimate"
StopReanimate.Parent = Mainframe
StopReanimate.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
StopReanimate.BorderColor3 = Color3.fromRGB(0, 0, 0)
StopReanimate.BorderSizePixel = 0
StopReanimate.Position = UDim2.new(0.264058679, 0, 0.25, 0)
StopReanimate.Size = UDim2.new(0, 192, 0, 32)
StopReanimate.Font = Enum.Font.SourceSans
StopReanimate.Text = ""
StopReanimate.TextColor3 = Color3.fromRGB(0, 0, 0)
StopReanimate.TextSize = 14.000
StopReanimate.MouseButton1Click:Connect(function()
	Stop()
	Running = false
end)

UICorner.Parent = StopReanimate

TextLabel_4.Parent = StopReanimate
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.0756800994, 0, 0.127580643, 0)
TextLabel_4.Size = UDim2.new(0, 100, 0, 22)
TextLabel_4.Font = Enum.Font.GothamMedium
TextLabel_4.Text = "Stop Reanimate"
TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.TextSize = 18.000
TextLabel_4.TextTransparency = 0.100

RunReanimate.Name = "Run Reanimate"
RunReanimate.Parent = Mainframe
RunReanimate.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
RunReanimate.BorderColor3 = Color3.fromRGB(0, 0, 0)
RunReanimate.BorderSizePixel = 0
RunReanimate.Position = UDim2.new(0.264058679, 0, 0.162844032, 0)
RunReanimate.Size = UDim2.new(0, 192, 0, 32)
RunReanimate.Font = Enum.Font.SourceSans
RunReanimate.Text = ""
RunReanimate.TextColor3 = Color3.fromRGB(0, 0, 0)
RunReanimate.TextSize = 14.000
RunReanimate.MouseButton1Click:Connect(function()
Empyrean = Start({
	Accessories = {
		{ MeshId = "125405780718494", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "137702817952968", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "135650240593878" },
		{ MeshId = "12344206657", Name = "Right Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344206675" },
		{ MeshId = "3030546036", Name = "Right Arm", Offset = CFrame.identity, TextureId = "3360974849" },
		{ MeshId = "12344207333", Name = "Left Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344207341" },
		{ MeshId = "3030546036", Name = "Left Arm", Offset = CFrame.identity, TextureId = "3360978739" },
		{ MeshId = "14768684979", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "14768683674" },
		{ MeshId = "137702817952968", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "73798034827573" },
		{ MeshId = "125405780718494", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "11263221350", Name = "Right Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11263219250" },
		{ MeshId = "3030546036", Name = "Right Leg", Offset = CFrame.identity, TextureId = "3650205764" },
		{ MeshId = "11159370334", Name = "Left Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11159284657" },
		{ MeshId = "3030546036", Name = "Left Leg", Offset = CFrame.identity, TextureId = "3860099469" },
		{ MeshId = "14768666349", Name = "Torso", Offset = CFrame.identity, TextureId = "14768664565" },
		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "125975972015302" },
		{ MeshId = "13778226115", Name = "Torso", Offset = CFrame.identity, TextureId = "13779858015" },
		{ MeshId = "4819720316", Name = "Torso", Offset = CFrame.identity, TextureId = "4819722776" },
	},
	ApplyDescription = true,
	BreakJointsDelay = 0.255,
	ClickFling = false,
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = true,
	HideCharacter = true,
	ParentCharacter = true,
	PermanentDeath = true,
	Refit = true,
	RigSize = 1,
	RigTransparency = 1,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
})

DefaultFlingOptions = {
	HatFling = false,
	Highlight = true,
	PredictionFling = true,
	Timeout = 1,
	ToolFling = false,
}

--[[
game.Players.LocalPlayer:GetMouse().Button1Down:Connect(function()
	Empyrean.Fling(game.Players.LocalPlayer:GetMouse().Target.Parent.Head,DefaultFlingOptions)
end)
]]--
	Running = true
end)

UICorner_2.Parent = RunReanimate

TextLabel_5.Parent = RunReanimate
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BackgroundTransparency = 1.000
TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(0.0756800994, 0, 0.127580643, 0)
TextLabel_5.Size = UDim2.new(0, 100, 0, 22)
TextLabel_5.Font = Enum.Font.GothamMedium
TextLabel_5.Text = "Run Reanimate"
TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.TextSize = 18.000
TextLabel_5.TextTransparency = 0.100

UICorner_3.Parent = Mainframe

AnimationMan.Name = "Animation Man"
AnimationMan.Parent = Mainframe
AnimationMan.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AnimationMan.BorderColor3 = Color3.fromRGB(0, 0, 0)
AnimationMan.BorderSizePixel = 0
AnimationMan.Position = UDim2.new(0.264058679, 0, 0.413594484, 0)
AnimationMan.Size = UDim2.new(0, 192, 0, 32)
AnimationMan.Font = Enum.Font.SourceSans
AnimationMan.Text = ""
AnimationMan.TextColor3 = Color3.fromRGB(0, 0, 0)
AnimationMan.TextSize = 14.000
AnimationMan.MouseButton1Click:Connect(function()
	if not Running then 
		game.StarterGui:SetCore("SendNotification",{
			Title = "meowhook V2";
			Text = "Please have reanimate running!"
		})
		return
	end
	game.Players.LocalPlayer:GetMouse().Button1Down:Connect(function()
		Empyrean.Fling(game.Players.LocalPlayer:GetMouse().Target.Parent.Head,DefaultFlingOptions)
	end)
	
	local uis = game:GetService("UserInputService")
	local cmt = {
		Angles = function(x,y,z,useRad)
			if not useRad then
				return CFrame.Angles(x,y,z)
			else
				return CFrame.Angles(math.rad(x),math.rad(y),math.rad(z))
			end
		end
	}
	local imt = {
		CreateWeld = function(p1,p2,c0,c1)
			c0,c1 = c0 or CFrame.new(0,0,0),c1 or CFrame.new(0,0,0)
			local weld = Instance.new("Motor6D",p1)
			weld.Part0,weld.Part1 = p1,p2
			weld.C0,weld.C1 = c0,c1
			return weld
		end,
		New = function(type,args)
			local instance = Instance.new(type)
			for i,v in pairs(args) do
				pcall(function()
					instance[i] = v
				end)
			end
			return instance
		end,
		Remove = function(instance,time)
			time = time or 0
			game:GetService("Debris"):AddItem(instance,time)
		end
	}
	local math     = setmetatable({random = function(minNum,maxNum,div) div = div or 1 return math.random(minNum * div,maxNum * div)/div end},{__index = math})
	local CFrame   = setmetatable(cmt,{__index = CFrame})
	local Instance = setmetatable(imt,{__index = Instance})

	local stepped = game:GetService("RunService").Stepped

	--BasicFunctions
	local ins    = Instance.new
	local v3     = Vector3.new
	local cf     = CFrame.new
	local angles = CFrame.Angles
	local rad    = math.rad
	local huge   = math.huge
	local cos    = math.cos
	local sin    = math.sin
	local tan    = math.tan
	local ray    = Ray.new
	local random = math.random
	local ud     = UDim.new
	local ud2    = UDim2.new
	local c3     = Color3.new
	local rgb    = Color3.fromRGB
	local bc     = BrickColor.new

	--Variables
	local plr	 = game.Players.LocalPlayer
	local plrg   = plr.PlayerGui
	local char   = Empyrean.Rig
	local h      = char.Head
	local t      = char.Torso
	local ra     = char["Right Arm"]
	local la     = char["Left Arm"]
	local rl     = char["Right Leg"]
	local ll     = char["Left Leg"]
	local rut    = char.HumanoidRootPart
	local hum    = char:FindFirstChildOfClass("Humanoid")
	local necno  = t.Neck
	local rutjno = rut.RootJoint
	local rsno   = t["Right Shoulder"]
	local lsno   = t["Left Shoulder"]
	local rhno   = t["Right Hip"]
	local lhno   = t["Left Hip"]
	--
	local change  = 1
	local sine    = 0
	local ws      = 8
	local jp      = 35
	local songPos = 1
	local jok     = false
	local sprint  = false
	local sitting = false
	local laying  = false
	local crying  = false
	local wsGrow  = false
	local muted   = false
	local anim    = "Idle"
	local asset   = "rbxassetid://"
	local songs = {
		2734040079,
		1179830130,
		152675132,
		1467405749,
		411386717,
		3517565766,
		509308446
	}
	--
	necc0,necc1=cf(0,t.Size.Y/2,0),cf(0,-h.Size.Y/2,0)
	rutjc0,rutjc1=cf(0,0,0),cf(0,0,0)
	rsc0,rsc1=cf(t.Size.X/2,t.Size.Y/4,0),cf(-ra.Size.X/2,ra.Size.Y/4,0)
	lsc0,lsc1=cf(-t.Size.X/2,t.Size.Y/4,0),cf(la.Size.X/2,la.Size.Y/4,0)
	rhc0,rhc1=cf(t.Size.X/4,-t.Size.Y/2,0),cf(0,rl.Size.Y/2,0)
	lhc0,lhc1=cf(-t.Size.X/4,-t.Size.Y/2,0),cf(0,ll.Size.Y/2,0)
	if char:FindFirstChild("Animate") then
		char.Animate:Destroy()
	end
	if hum:FindFirstChildOfClass("Animator") then
		hum.Animator:Destroy()
	end
	--Creating new joints
	local nec = ins("Motor6D",t) nec.Name = "Neck" nec.Part0 = t nec.Part1 = h
	local rutj = ins("Motor6D",rut) rutj.Name = "RootJoint" rutj.Part0 = t rutj.Part1 = rut
	local rs = ins("Motor6D",t) rs.Name = "Right Shoulder" rs.Part0 = t rs.Part1 = ra
	local ls = ins("Motor6D",t) ls.Name = "Left Shoulder" ls.Part0 = t ls.Part1 = la
	local rh = ins("Motor6D",t) rh.Name = "Right Hip" rh.Part0 = t rh.Part1 = rl
	local lh = ins("Motor6D",t) lh.Name = "Left Hip" lh.Part0 = t lh.Part1 = ll
	--Removing old joints
	necno.Parent = nil
	rutjno.Parent = nil
	rsno.Parent = nil
	lsno.Parent = nil
	rhno.Parent = nil
	lhno.Parent = nil
	--Setting CFrames
	nec.C1 = necc1
	nec.C0 = necc0
	rs.C1 = rsc1
	rs.C0 = rsc0
	ls.C1 = lsc1
	ls.C0 = lsc0
	rh.C1 = rhc1
	rh.C0 = rhc0
	lh.C1 = lhc1
	lh.C0 = lhc0
	rutj.C1 = rutjc1
	rutj.C0 = rutjc0

	local mus = Instance.New("Sound",{Looped = true,Volume = .5,SoundId = asset..songs[songPos],Parent = t})
	local vroOm = Instance.New("Sound",{Looped = true,Volume = 7.5,SoundId = asset..2658538628,Parent = t})
	if jok then
		mus:Play()
	end

	function swait()
		stepped:Wait()
	end
	function rayc(spos,direc,ignore,dist)
		return workspace:FindPartOnRayWithIgnoreList(ray(spos,direc.Unit * dist),ignore,false,false)
	end
	function tween(instance,args,info,playOnCreate)
		if instance and args then
			playOnCreate = playOnCreate or true
			info = info or TweenInfo.new(
				1,
				Enum.EasingStyle.Linear,
				Enum.EasingDirection.In,
				0,
				false,
				0
			)
			if typeof(info) == "table" then
				info = TweenInfo.new(unpack(info))
			end
			local tween = game:GetService("TweenService"):Create(instance,info,args)
			if playOnCreate then
				tween:Play()
			end
			return tween
		end
	end

	bindslol = function(input)
		if input == "leftcontrol" then
			sprint = not sprint
		elseif input == "n" then
			jok = not jok
		elseif input == "z" then
			sitting = not sitting
			laying = false
			crying = false
		elseif input == "x" then
			sitting = false
			laying = not laying
			crying = false
		elseif input == "c" then
			sitting = false
			laying = false
			crying = not crying
		elseif input == "l" then
			songPos = songPos + 1
			if songPos > #songs then
				songPos = 1
			end
			mus.SoundId = asset..songs[songPos]
			mus:Play()
			mus.TimePosition = 0
		elseif input == "m" then
			muted = not muted
		end
	end

	game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(kai)
		key = kai:lower()
		bindslol(key)
	end)

	stepped:Connect(function()
		sine = sine + change

		local dir = hum.MoveDirection
		if dir.Magnitude == 0 then dir = rut.Velocity/10 end

		local Ccf		  = rut.CFrame
		local Walktest1   = dir*Ccf.LookVector
		local Walktest2   = dir*Ccf.RightVector
		local rotfb		  = Walktest1.X+Walktest1.Z
		local rotrl		  = Walktest2.X+Walktest2.Z

		local hit,pos,rot = rayc(rut.Position,-rut.CFrame.UpVector,{char},4.5)

		local verVel	  = rut.Velocity.y
		local horVel	  = (rut.Velocity * v3(1,0,1)).Magnitude

		if mus.Parent ~= t then
			Instance.Remove(mus)
			mus = Instance.New("Sound",{Looped = true,Volume = .5,SoundId = asset..songs[songPos],Parent = t})
			mus:Play()
		end
		if vroOm.Parent ~= t then
			Instance.Remove(vroOm)
			vroOm = Instance.New("Sound",{Looped = true,Volume = 7.5,SoundId = asset..2658538628,Parent = t})
		end
		if rotfb > 1 then
			rotfb = 1
		elseif rotfb < -1 then
			rotfb = -1
		end
		if rotrl > 1 then
			rotrl = 1
		elseif rotrl < -1 then
			rotrl = -1
		end

		if jok then
			if not sprint then
				ws = 16
			else
				if not wsGrow then
					ws = 6
				end
			end
			jp = 65
			if not muted then
				mus:Resume()
			else
				mus:Stop()
			end
		else
			if not sprint then
				ws = 8
			else
				ws = 38
			end
			jp = 35
			mus:Stop()
		end

		hum.WalkSpeed = ws
		hum.JumpPower = jp

		local sn = 0 if plr.Name == "vlad20020" and random(0,1,50) == .6 then sn = random(5,10) end

		if anim == "walk" and hit then
			if not jok then
				nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(cos(sine/3) * 5,0,0,true) * angles(-rotfb/15,rotrl/2,0),.2)
				rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,.2 * cos(sine/3),0) * angles(sin(sine/3) * 2.5,sin(sine/6) * 2.5,0,true) * angles(-rotfb/12.5,0,-rotrl/8.5),.2)
				rs.C1 = rs.C1:Lerp(rsc1 * cf(.05 - .05 *  cos(sine/3),0,.1 * cos(sine/6) * rotfb) * angles(-10 - sin(sine/6) * 40 * rotfb,-sin(sine/6) * 25 * rotfb,0,true),.2)
				ls.C1 = ls.C1:Lerp(lsc1 * cf(-.05 + .05 *  cos(sine/3),0,-.1 * cos(sine/6) * rotfb) * angles(-10 + sin(sine/6) * 40 * rotfb,-sin(sine/6) * 25 * rotfb,0,true),.2)
				rh.C1 = rh.C1:Lerp(rhc1 * cf(0,.2 * cos(sine/6),.3 * -cos(sine/6)) * angles((7.5 * math.abs(rotfb)) + sin(sine/6) * 40 * rotfb,sin(sine/6) * 5,sin(sine/6) * 40 * rotrl,true),.2)
				lh.C1 = lh.C1:Lerp(lhc1 * cf(0,-.2 * cos(sine/6),.3 * cos(sine/6)) * angles((7.5 * math.abs(rotfb)) - sin(sine/6) * 40 * rotfb,sin(sine/6) * 5,-sin(sine/6) * 40 * rotrl,true),.2)
				wsGrow = false
				vroOm:Stop()
			else
				nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(sin(sine/5) * 15,sin(sine/10) * 20,0,true) * angles(-rotfb/10,rotrl/2,0),.2)
				rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,cos(sine/5) * 2.5,0) * angles(0,sin(sine/10) * 20,0,true) * angles(-rotfb/5,0,-rotrl/5),.2)
				rs.C1 = rs.C1:Lerp(rsc1 * cf(0,0,sin(sine/10) * 2.5 * rotfb) * angles(-15 + (sin(-sine/10) * 60 * rotfb),(-sin(sine/10) * 20) * rotfb,0,true),.2)
				ls.C1 = ls.C1:Lerp(lsc1 * cf(0,0,-sin(sine/10) * 2.5 * rotfb) * angles(-15 + (sin(sine/10) * 60 * rotfb),(-sin(sine/10) * 20) * rotfb,0,true),.2)
				rh.C1 = rh.C1:Lerp(rhc1 * cf((sin(sine/10) * 2.5) * rotrl,cos(sine/10) * 2.5,(-sin(sine/10) * 2.5) * rotfb) * angles(6.5 - (-sin(sine/10) * 35) * rotfb,sin(sine/10) * 10,(sin(sine/10) * 35) * rotrl,true),.2)
				lh.C1 = lh.C1:Lerp(lhc1 * cf((-sin(sine/10) * 2.5) * rotrl,-cos(sine/10) * 2.5,(sin(sine/10) * 2.5) * rotfb) * angles(6.5 - (sin(sine/10) * 35) * rotfb,sin(sine/10) * 10,(-sin(sine/10) * 35) * rotrl,true),.2)
				wsGrow = false
				vroOm:Stop()
			end
		elseif anim == "run" and hit then
			if not jok then
				nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(cos(sine/3) * 7.5,sin(sine/6) * 5,0,true) * angles(-rotfb/10,rotrl/2,0),.2)
				rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,.4 * cos(sine/3),0) * angles(sin(sine/3) * 4,sin(sine/6) * 7.5,0,true) * angles(-rotfb/5,0,-rotrl/5),.2)
				rs.C1 = rs.C1:Lerp(rsc1 * cf(.1 - .1 *  cos(sine/3),0,-.15 - .2 * cos(sine/6) * rotfb) * angles(-15 - sin(sine/6) * 110 * rotfb,-sin(sine/6) * 25 * rotfb,-10,true),.2)
				ls.C1 = ls.C1:Lerp(lsc1 * cf(-.1 + .1 *  cos(sine/3),0,-.15 +.2 * cos(sine/6) * rotfb) * angles(-15 + sin(sine/6) * 110 * rotfb,-sin(sine/6) * 25 * rotfb,10,true),.2)
				rh.C1 = rh.C1:Lerp(rhc1 * cf(0,.5 * cos(sine/6),.75 * -cos(sine/6)) * angles((7.5 * math.abs(rotfb)) + (sin(sine/6) * 80 * rotfb),sin(sine/6) * 15,sin(sine/6) * 60 * rotrl,true),.2)
				lh.C1 = lh.C1:Lerp(lhc1 * cf(0,.5 * -cos(sine/6),.75 * cos(sine/6)) * angles((7.5 * math.abs(rotfb)) + (-sin(sine/6) * 80 * rotfb),sin(sine/6) * 15,-sin(sine/6) * 60 * rotrl,true),.2)
				wsGrow = false
				vroOm:Stop()
			else
				nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(0,0,0,true) * angles(-rotfb * 1.5,0,0),.2)
				rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,-math.abs(rotfb * 1.5) + 1 * sin(sine),0) * angles(sin(sine) * 25,0,cos(sine) * 15,true) * angles(-rotfb * 1.5,0,-rotrl * 1.5),.2)
				rs.C1 = rs.C1:Lerp(rsc1 * cf(0,0,0) * angles(-sine * 50 * (ws/750) * rotfb,sin(sine) * 200,sine * 50 * (ws/750) * rotrl,true),.2)
				ls.C1 = ls.C1:Lerp(lsc1 * cf(0,0,0) * angles(-sine * 50 * (ws/750) * rotfb,sin(sine) * 200,sine * 50 * (ws/750) * rotrl,true),.2)
				rh.C1 = rh.C1:Lerp(rhc1 * cf(0,0,1 * sin(sine/5) * 5 * (ws/750)) * angles(sine * 50 * (ws/750) * rotfb,0,sine * 50 * (ws/750) * rotrl,true),.2)
				lh.C1 = lh.C1:Lerp(lhc1 * cf(0,0,-1 * sin(sine/5) * 5 * (ws/750)) * angles(sine * 50 * (ws/750) * rotfb,0,sine * 50 * (ws/750) * rotrl,true),.2)
				vroOm:Resume()
				if vroOm.TimePosition > vroOm.TimeLength -.1 then
					vroOm.TimePosition = 8.5
				end
				if vroOm.TimePosition < .1 then
					ws = 6
				end
				if vroOm.TimePosition < 8.5 then
					ws = ws + .01
				else
					ws = 750
					wsGrow = true
				end
			end
		elseif anim == "jump" and not hit then
			nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(0,0,0,true),.2)
			rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,0,0) * angles(0,0,0,true) * angles(-rotfb/5,0,-rotrl/5),.2)
			rs.C1 = rs.C1:Lerp(rsc1 * cf(0,0,0) * angles(0,0,0,true),.2)
			ls.C1 = ls.C1:Lerp(lsc1 * cf(0,0,0) * angles(0,0,0,true),.2)
			rh.C1 = rh.C1:Lerp(rhc1 * cf(0,0,0) * angles(0,0,0,true),.2)
			lh.C1 = lh.C1:Lerp(lhc1 * cf(0,0,0) * angles(0,0,0,true),.2)
		elseif anim == "fall" and not hit then
			nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(0,0,0,true),.2)
			rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,0,0) * angles(0,0,0,true) * angles(-rotfb/5,0,-rotrl/5),.2)
			rs.C1 = rs.C1:Lerp(rsc1 * cf(0,0,0) * angles(sin(sine/10) * 5,cos(sine/10) * 5,0,true),.2)
			ls.C1 = ls.C1:Lerp(lsc1 * cf(0,0,0) * angles(-sin(sine/10) * 5,-cos(sine/10) * 5,0,true),.2)
			rh.C1 = rh.C1:Lerp(rhc1 * cf(0,0,0) * angles(0,0,0,true),.2)
			lh.C1 = lh.C1:Lerp(lhc1 * cf(0,0,0) * angles(0,0,0,true),.2)
		elseif anim == "idle" and hit then
			if not jok or sitting or laying or crying then
				nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(cos(sine/20) * 4,sin(sine/80) * 10,0,true) * angles(random(-sn,sn),random(-sn,sn),random(-sn,sn),true),.2)
				rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(sin(sine/80)/20,sin(sine/20)/15,sin(sine/30)/17.5) * angles(sin(sine/20) * .9,sin(sine/60) * 2.25,sin(sine/80) * 2.25,true),.2)
				rs.C1 = rs.C1:Lerp(rsc1 * cf(0,sin(sine/20)/15,0) * angles((cos(sine/20) * 4),sin(sine/20) * 1.8,(sin(sine/80) * 2.25) + (cos(sine/20) * 2.25),true),.2)
				ls.C1 = ls.C1:Lerp(lsc1 * cf(0,sin(sine/20)/15,0) * angles((cos(sine/20) * 4),-sin(sine/20) * 1.8,(sin(sine/80) * 2.25) + (-cos(sine/20) * 2.25),true),.2)
				rh.C1 = rh.C1:Lerp(rhc1 * cf(0,(sin(sine/20)/15) + (sin(sine/80)/25),0) * angles((sin(sine/20) * 1.8) - (sin(sine/30) * 2.25) + (sin(sine/60) * 1.35),sin(sine/60) * 2.25,(sin(sine/80) * 3.25),true),.2)
				lh.C1 = lh.C1:Lerp(lhc1 * cf(0,(sin(sine/20)/15) - (sin(sine/80)/25),0) * angles((sin(sine/20) * 1.8) - (sin(sine/30) * 2.25) - (sin(sine/60) * 1.35),sin(sine/60) * 2.25,(sin(sine/80) * 3.25),true),.2)
				wsGrow = false
				vroOm:Stop()
			elseif jok and not sitting and not laying and not crying then
				nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(-cos(sine/10) * sin(sine/20) * 45,sin(sine/20) * cos(sine/40) * 30,sin(sine/30) * cos(sine/60) * 20,true),.2)
				rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(.25 * sin(sine/30) * cos(sine/60),-.65 + 1 * sin(sine/10) * cos(sine/20),0) * angles(sin(sine/10) * cos(sine/20) * 35,0,sin(sine/30) * cos(sine/60) * 10,true),.2)
				rs.C1 = rs.C1:Lerp(rsc1 * cf(0,.25 - .25 * sin(sine/20) * cos(sine/10),.25 * sin(sine/10) * cos(sine/20)) * angles(-105 + sin(sine/20) * cos(sine/10) * 65,sin(sine/20) * cos(sine/60) * 5,sin(sine/10) * cos(sine/20) * 70,true),.2)
				ls.C1 = ls.C1:Lerp(lsc1 * cf(0,.25 - .25 * sin(sine/20) * cos(sine/10),.25 * sin(sine/10) * cos(sine/20)) * angles(-105 + sin(sine/20) * cos(sine/10) * 65,sin(sine/20) * cos(sine/60) * 5,sin(sine/10) * cos(sine/20) * -70,true),.2)
				rh.C1 = rh.C1:Lerp(rhc1 * cf(0,-.625 + 1 * sin(sine/10) * cos(sine/20),.25 - .5 * sin(sine/10) * cos(sine/20)) * angles(10 + sin(sine/10) * cos(sine/20) * 40,0,sin(sine/30) * cos(sine/60) * 17.5,true),.2)
				lh.C1 = lh.C1:Lerp(lhc1 * cf(0,-.625 + 1 * sin(sine/10) * cos(sine/20),.25 - .5 * sin(sine/10) * cos(sine/20)) * angles(10 + sin(sine/10) * cos(sine/20) * 40,0,sin(sine/30) * cos(sine/60) * 17.5,true),.2)
				wsGrow = false
				vroOm:Stop()
			end
		end

		if verVel > 20 then
			anim = "jump"
			change = 1
			nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(5,0,0,true),.2)
			rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(-5,0,0,true),.2)
			rs.C0 = rs.C0:Lerp(rsc0 * cf(0,-.15,-.25) * angles(150,10,12.5,true),.2)
			ls.C0 = ls.C0:Lerp(lsc0 * cf(0,-.15,-.25) * angles(155,-10,-12.5,true),.2)
			rh.C0 = rh.C0:Lerp(rhc0 * cf(0,.5,-.35) * angles(-12.5,0,5,true),.2)
			lh.C0 = lh.C0:Lerp(lhc0 * cf(0,.2,-.15) * angles(-2.5,0,-5,true),.2)
		elseif verVel < -20 then
			anim = "fall"
			change = 1
			nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(-7.5,0,0,true),.2)
			rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(5,0,0,true),.2)
			rs.C0 = rs.C0:Lerp(rsc0 * cf(.25,-.25,0) * angles(0,10,110,true),.2)
			ls.C0 = ls.C0:Lerp(lsc0 * cf(-.25,-.25,0) * angles(0,-10,-110,true),.2)
			rh.C0 = rh.C0:Lerp(rhc0 * cf(0,.2,-.15) * angles(-2.5,0,5,true),.2)
			lh.C0 = lh.C0:Lerp(lhc0 * cf(0,.5,-.35) * angles(-12.5,0,-5,true),.2)
		elseif horVel > 5 and verVel > -20 and verVel < 20 then
			if not sprint then
				anim = "walk"
				if not jok then
					change = .6
				else
					change = 1
				end
				nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				rs.C0 = rs.C0:Lerp(rsc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				ls.C0 = ls.C0:Lerp(lsc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(0,0,0,true),.2)
			else
				anim = "run"
				if not jok then
					change = .9
				else
					change = 1
				end
				nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				rs.C0 = rs.C0:Lerp(rsc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				ls.C0 = ls.C0:Lerp(lsc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(0,0,0,true),.2)
			end
		elseif horVel < 5 and verVel > -20 and verVel < 20 then
			anim = "idle"
			change = 1
			if not sitting and not laying and not crying then
				if not jok then
					nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(0,0,0,true),.2)
					rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(0,0,0,true),.2)
					rs.C0 = rs.C0:Lerp(rsc0 * cf(0,0,0) * angles(.5,0,-.5,true),.2)
					ls.C0 = ls.C0:Lerp(lsc0 * cf(0,0,0) * angles(.5,0,.5,true),.2)
					rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(0,-2.5,2,true),.2)
					lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(0,2.5,-2,true),.2)
				else
					nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(0,0,0,true),.2)
					rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(0,0,0,true),.2)
					rs.C0 = rs.C0:Lerp(rsc0 * cf(0,0,0) * angles(0,0,0,true),.2)
					ls.C0 = ls.C0:Lerp(lsc0 * cf(0,0,0) * angles(0,0,0,true),.2)
					rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(0,0,5,true),.2)
					lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(0,0,-5,true),.2)
				end
			elseif sitting and not laying and not crying then
				nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(-20,0,0,true),.2)
				rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,1.75,0) * angles(-15,0,0,true),.2)
				rs.C0 = rs.C0:Lerp(rsc0 * cf(-.1,-.5,.15) * angles(-20,-60,10,true),.2)
				ls.C0 = ls.C0:Lerp(lsc0 * cf(0,-.25,-.2) * angles(70,-60,60,true) * angles(40,0,0,true),.2)
				rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(70,7.5,5,true),.2)
				lh.C0 = lh.C0:Lerp(lhc0 * cf(0,1.25,-.5) * angles(10,-10,-5,true),.2)
			elseif not sitting and laying and not crying then
				nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(-35,0,0,true),.2)
				rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,-2.4) * angles(-87.5,0,0,true),.2)
				rs.C0 = rs.C0:Lerp(rsc0 * cf(-.1,.75,-.25) * angles(195,0,-65,true) * angles(0,90,0,true),.2)
				ls.C0 = ls.C0:Lerp(lsc0 * cf(.125,-.3,-.05) * angles(90,20,85,true) * angles(-30,20,0,true),.2)
				rh.C0 = rh.C0:Lerp(rhc0 * cf(0,.25,-1) * angles(-55,20,7.5,true),.2)
				lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(2,-7.5,5,true),.2)
			elseif not sitting and not laying and crying then
				nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(-80,0,0,true),.2)
				rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,1.9,0) * angles(10,0,0,true),.2)
				rs.C0 = rs.C0:Lerp(rsc0 * cf(-.25,-.475,-.8) * angles(85,0,-80,true) * angles(0,100,0,true),.2)
				ls.C0 = ls.C0:Lerp(lsc0 * cf(.25,-.4,-.75) * angles(80,0,85,true) * angles(0,-87.5,0,true),.2)
				rh.C0 = rh.C0:Lerp(rhc0 * cf(0,1.85,-.75) * angles(5,-5,-5,true),.2)
				lh.C0 = lh.C0:Lerp(lhc0 * cf(0,1.85,-.7) * angles(3.5,5,5,true),.2)
			end
		end
	end)
end)

UICorner_4.Parent = AnimationMan

TextLabel_6.Parent = AnimationMan
TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.BackgroundTransparency = 1.000
TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_6.BorderSizePixel = 0
TextLabel_6.Position = UDim2.new(0.0756800994, 0, 0.127580643, 0)
TextLabel_6.Size = UDim2.new(0, 100, 0, 22)
TextLabel_6.Font = Enum.Font.GothamMedium
TextLabel_6.Text = "Animation Man"
TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.TextSize = 18.000
TextLabel_6.TextTransparency = 0.100
