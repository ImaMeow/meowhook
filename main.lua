chillvoid1=function()
do
	local Accessories = {}

	local Aligns = {}

	local Attachments = {}

	local BindableEvent = nil

	local Blacklist = {}

	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new

	local Character = nil

	local CurrentCamera = nil

	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local MouseButton1 = Enum.UserInputType.MouseButton1

	local Exceptions = {}

	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 27, 0)
	local HideCharacterOffset = Vector3new(0, 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BacekndAccoutrementState", true)
					Descendant.BackendAccoutrementState = 0
				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					ApplyDescription(RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									Vector3zero = ( Position - LastPosition ) / DeltaTime * 0.13
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = Target.CFrame + Offset
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local RootPartCFrame = RigHumanoidRootPart.CFrame - HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)

				taskwait(Players.RespawnTime + 0.1)

				Refitting = false
				replicatesignal(Kill)
			else
				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if Humanoid then
				ChangeState(Humanoid, Dead)
				Wait(Humanoid.Died)
			end

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end

	local OnInputBegan = function(InputObject)
		if InputObject.UserInputType == MouseButton1 then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = false
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						UnequipTools(Humanoid)
						taskwait()
						EquipTool(Humanoid, Tool)

						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end

						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end

	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end

		if IsRegistered then
			SetCore(StarterGui, "ResetButtonCallback", BindableEvent)
		else
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius

			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = LocalPlayer.Name
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

Empyrean = Start({
	Accessories = {
		{ MeshId = "117287001096396", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.identity, TextureId = "120169691545791" },
		{ MeshId = "137702817952968", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "135650240593878" },
		{ MeshId = "125405780718494", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "12344206657", Name = "Right Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344206675" },
		{ MeshId = "3030546036", Name = "Right Arm", Offset = CFrame.identity, TextureId = "3360974849" },
		{ MeshId = "12344207333", Name = "Left Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344207341" },
		{ MeshId = "3030546036", Name = "Left Arm", Offset = CFrame.identity, TextureId = "3360978739" },
		{ MeshId = "121304376791439", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.identity, TextureId = "131014325980101" },
		{ MeshId = "137702817952968", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "73798034827573" },
		{ MeshId = "125405780718494", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "11263221350", Name = "Right Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11263219250" },
		{ MeshId = "3030546036", Name = "Right Leg", Offset = CFrame.identity, TextureId = "3650205764" },
		{ MeshId = "11159370334", Name = "Left Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11159284657" },
		{ MeshId = "3030546036", Name = "Left Leg", Offset = CFrame.identity, TextureId = "3860099469" },
		{ MeshId = "127552124837034", Name = "Torso", Offset = CFrame.identity, TextureId = "131014325980101" },
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
	HatDrop = false,
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

task.wait(2)

local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = Empyrean.Rig;
if Char:FindFirstChild("Accessory (VoidRPG)") then
	Char["Accessory (VoidRPG)"].Handle.AccessoryWeld.Part1 = Char["Right Arm"]
	Char["Accessory (VoidRPG)"].Handle.AccessoryWeld.C1 = CF.N(-.5,0,-1) * CF.A(0,math.rad(90),math.rad(-45))
end
if Char:FindFirstChild("Accessory (VoidAlligatorJaw)") then
	Char["Accessory (VoidAlligatorJaw)"].Handle.AccessoryWeld.Part1 = Char["Right Arm"]
	Char["Accessory (VoidAlligatorJaw)"].Handle.AccessoryWeld.C1 = CF.N(-.5,-5,-1.05) * CF.A(0,math.rad(90),math.rad(-135))
end
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims)then	
if(State == 'Idle')then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/64),4+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/64),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(20+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.7+-0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(20+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.7+0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(-20+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/64),4+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/64),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(20+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.7+-0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(20+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.7+0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(-20+0*M.S(Sine/24))),0.2,'Lerp')

elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-15)),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(15)),.2,'Lerp')
Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT JUMP LERPS
]]
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-45)+idk),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(45)-idk),.2,'Lerp')

Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')

Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT FALL LERPS
]]
end
end	

fwait()
end
end

chillvoid2=function()
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 117311153426168,116940095199813 meowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeow")
getgenv().Options = {
	["Jitteryness"] = Vector3.new(30.5,0,0), -- Velocity
	["Jitterless"] = true, -- Very Small Jitter, Smaller Delay
	["Type"] = "Raw", -- Raw (Simple), Fling, Bullet, Godmode
	["InstantBullet"] = {
		["Bool"] = true, -- Enables it
		["SmartLock"] = true -- Locks Bullet On Head On Hold; Disables "Bullet Follow Pointer" Thingy on hold.
	}, -- Type has to be Bullet/Godmode
	["R15Method"] = "Align", -- Align,AlignMax Or CFrame
	["R6Method"] = "Align", -- Align,AlignMax Or CFrame
	["BonusProperties"] = true, -- Net, and other stuff.
	["RigAnimations"] = true, -- Enables Default Animate
	["LoadLibrary"] = false, -- Loads LoadLibrary for scripts that still use it.
	["Logging"] = false -- Enables logging (prints debug information in console)
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/StrokeThePea/CatwareReanimate/main/src/Source.lua"))()

task.wait(2)

local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = Plr.Character;
if Char:FindFirstChild("Accessory (VoidRPG)") then
	Char["Accessory (VoidRPG)"].Handle.AccessoryWeld.Part1 = Char["Right Arm"]
	Char["Accessory (VoidRPG)"].Handle.AccessoryWeld.C1 = CF.N(-.5,0,-1) * CF.A(0,math.rad(90),math.rad(-45))
end
if Char:FindFirstChild("Accessory (VoidAlligatorJaw)") then
	Char["Accessory (VoidAlligatorJaw)"].Handle.AccessoryWeld.Part1 = Char["Right Arm"]
	Char["Accessory (VoidAlligatorJaw)"].Handle.AccessoryWeld.C1 = CF.N(-.5,-5,-1.05) * CF.A(0,math.rad(90),math.rad(-135))
end
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims)then	
if(State == 'Idle')then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/64),4+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/64),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(20+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.7+-0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(20+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.7+0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(-20+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/64),4+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/64),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(20+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1.45+0*M.S(Sine/64),0.5+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(-60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.7+-0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(20+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.7+0.2*M.S(Sine/64),3+0.5*M.S(Sine/64), -1.5+0*M.S(Sine/24)) * CF.A(M.R(60+20*M.S(Sine/64)), M.R(0+0*M.S(Sine/64)) ,M.R(-20+0*M.S(Sine/24))),0.2,'Lerp')

elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-15)),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(15)),.2,'Lerp')
Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT JUMP LERPS
]]
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-45)+idk),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(45)-idk),.2,'Lerp')

Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')

Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT FALL LERPS
]]
end
end	

fwait()
end
end

amongus1=function()
do
	local Accessories = {}

	local Aligns = {}

	local Attachments = {}

	local BindableEvent = nil

	local Blacklist = {}

	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new

	local Character = nil

	local CurrentCamera = nil

	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local MouseButton1 = Enum.UserInputType.MouseButton1

	local Exceptions = {}

	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 27, 0)
	local HideCharacterOffset = Vector3new(0, 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BacekndAccoutrementState", true)
					Descendant.BackendAccoutrementState = 0
				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					ApplyDescription(RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									Vector3zero = ( Position - LastPosition ) / DeltaTime * 0.13
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = Target.CFrame + Offset
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local RootPartCFrame = RigHumanoidRootPart.CFrame - HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)

				taskwait(Players.RespawnTime + 0.1)

				Refitting = false
				replicatesignal(Kill)
			else
				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if Humanoid then
				ChangeState(Humanoid, Dead)
				Wait(Humanoid.Died)
			end

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end

	local OnInputBegan = function(InputObject)
		if InputObject.UserInputType == MouseButton1 then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = false
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						UnequipTools(Humanoid)
						taskwait()
						EquipTool(Humanoid, Tool)

						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end

						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end

	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end

		if IsRegistered then
			SetCore(StarterGui, "ResetButtonCallback", BindableEvent)
		else
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius

			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = LocalPlayer.Name
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

Empyrean = Start({
	Accessories = {
		{ MeshId = "117287001096396", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.identity, TextureId = "120169691545791" },
		{ MeshId = "137702817952968", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "135650240593878" },
		{ MeshId = "125405780718494", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "12344206657", Name = "Right Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344206675" },
		{ MeshId = "3030546036", Name = "Right Arm", Offset = CFrame.identity, TextureId = "3360974849" },
		{ MeshId = "12344207333", Name = "Left Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344207341" },
		{ MeshId = "3030546036", Name = "Left Arm", Offset = CFrame.identity, TextureId = "3360978739" },
		{ MeshId = "121304376791439", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.identity, TextureId = "131014325980101" },
		{ MeshId = "137702817952968", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "73798034827573" },
		{ MeshId = "125405780718494", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "11263221350", Name = "Right Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11263219250" },
		{ MeshId = "3030546036", Name = "Right Leg", Offset = CFrame.identity, TextureId = "3650205764" },
		{ MeshId = "11159370334", Name = "Left Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11159284657" },
		{ MeshId = "3030546036", Name = "Left Leg", Offset = CFrame.identity, TextureId = "3860099469" },
		{ MeshId = "127552124837034", Name = "Torso", Offset = CFrame.identity, TextureId = "131014325980101" },
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
	HatDrop = false,
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

task.wait(2)

local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = Empyrean.Rig;
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims)then	
if(State == 'Idle')then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.2*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+10*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),0.5+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.2*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+10*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),0.5+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+0.5*M.S(Sine/10)) * CF.A(M.R(0+-20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+-0.5*M.S(Sine/10)) * CF.A(M.R(0+20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')

elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-15)),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(15)),.2,'Lerp')
Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT JUMP LERPS
]]
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-45)+idk),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(45)-idk),.2,'Lerp')

Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')

Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT FALL LERPS
]]
end
end	

fwait()
end
end

amongus2=function()
getgenv().Options = {
	["Jitteryness"] = Vector3.new(30.5,0,0), -- Velocity
	["Jitterless"] = true, -- Very Small Jitter, Smaller Delay
	["Type"] = "Raw", -- Raw (Simple), Fling, Bullet, Godmode
	["InstantBullet"] = {
		["Bool"] = true, -- Enables it
		["SmartLock"] = true -- Locks Bullet On Head On Hold; Disables "Bullet Follow Pointer" Thingy on hold.
	}, -- Type has to be Bullet/Godmode
	["R15Method"] = "Align", -- Align,AlignMax Or CFrame
	["R6Method"] = "Align", -- Align,AlignMax Or CFrame
	["BonusProperties"] = true, -- Net, and other stuff.
	["RigAnimations"] = true, -- Enables Default Animate
	["LoadLibrary"] = false, -- Loads LoadLibrary for scripts that still use it.
	["Logging"] = false -- Enables logging (prints debug information in console)
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/StrokeThePea/CatwareReanimate/main/src/Source.lua"))()

task.wait(2)

local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = Plr.Character;
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims)then	
if(State == 'Idle')then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.2*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+10*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),0.5+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.2*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+10*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),0.5+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-0.5+0*M.S(Sine/24),0.5+0*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+0.5*M.S(Sine/10)) * CF.A(M.R(0+-20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+-0.5*M.S(Sine/10)) * CF.A(M.R(0+20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')

elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-15)),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(15)),.2,'Lerp')
Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT JUMP LERPS
]]
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-45)+idk),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(45)-idk),.2,'Lerp')

Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')

Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT FALL LERPS
]]
end
end	

fwait()
end
end

doll1=function()
game.StarterGui:SetCore("SendNotification",{
	Title = "meowhook | Doll";
	Text = "It is recommended to not wear any hats"
})
do
	local Accessories = {}

	local Aligns = {}

	local Attachments = {}

	local BindableEvent = nil

	local Blacklist = {}

	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new

	local Character = nil

	local CurrentCamera = nil

	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local MouseButton1 = Enum.UserInputType.MouseButton1

	local Exceptions = {}

	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 27, 0)
	local HideCharacterOffset = Vector3new(0, 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BacekndAccoutrementState", true)
					Descendant.BackendAccoutrementState = 0
				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					ApplyDescription(RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									Vector3zero = ( Position - LastPosition ) / DeltaTime * 0.13
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = Target.CFrame + Offset
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local RootPartCFrame = RigHumanoidRootPart.CFrame - HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)

				taskwait(Players.RespawnTime + 0.1)

				Refitting = false
				replicatesignal(Kill)
			else
				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if Humanoid then
				ChangeState(Humanoid, Dead)
				Wait(Humanoid.Died)
			end

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end

	local OnInputBegan = function(InputObject)
		if InputObject.UserInputType == MouseButton1 then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = false
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						UnequipTools(Humanoid)
						taskwait()
						EquipTool(Humanoid, Tool)

						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end

						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end

	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end

		if IsRegistered then
			SetCore(StarterGui, "ResetButtonCallback", BindableEvent)
		else
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius

			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = LocalPlayer.Name
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

Empyrean = Start({
	Accessories = {
		{ MeshId = "117287001096396", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.identity, TextureId = "120169691545791" },
		{ MeshId = "137702817952968", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "135650240593878" },
		{ MeshId = "125405780718494", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "12344206657", Name = "Right Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344206675" },
		{ MeshId = "3030546036", Name = "Right Arm", Offset = CFrame.identity, TextureId = "3360974849" },
		{ MeshId = "12344207333", Name = "Left Arm", Offset = CFrame.Angles(math.rad(60),math.rad(-180),math.rad(-180)), TextureId = "12344207341" },
		{ MeshId = "3030546036", Name = "Left Arm", Offset = CFrame.identity, TextureId = "3360978739" },
		{ MeshId = "121304376791439", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.identity, TextureId = "131014325980101" },
		{ MeshId = "137702817952968", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "73798034827573" },
		{ MeshId = "125405780718494", Names = { "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "136752500636691" },
		{ MeshId = "11263221350", Name = "Right Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11263219250" },
		{ MeshId = "3030546036", Name = "Right Leg", Offset = CFrame.identity, TextureId = "3650205764" },
		{ MeshId = "11159370334", Name = "Left Leg", Offset = CFrame.Angles(0,0,math.rad(-90)), TextureId = "11159284657" },
		{ MeshId = "3030546036", Name = "Left Leg", Offset = CFrame.identity, TextureId = "3860099469" },
		{ MeshId = "127552124837034", Name = "Torso", Offset = CFrame.identity, TextureId = "131014325980101" },
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
	HatDrop = false,
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

task.wait(2)

DoingAction = false
ActionType = 0
game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(kai)
	key = kai:lower()
	if key == "q" then
		DoingAction = false
		ActionType = 0
    elseif key == "e" then
        DoingAction = true
        ActionType = 1
	end
end)
local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = Empyrean.Rig;
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims)then	
if(State == 'Idle') and DoingAction == false then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.1*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(-40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Idle') and DoingAction == true then
	if ActionType == 1 then
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.1*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),-2+0*M.S(Sine/24), -2+1*M.S(Sine/10)) * CF.A(M.R(-90+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('RS',CF.N(1+0*M.S(Sine/24),-0.2+0*M.S(Sine/24), -1+1*M.S(Sine/10)) * CF.A(M.R(40+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('LS',CF.N(-1+0*M.S(Sine/24),-0.2+0*M.S(Sine/24), -1+1*M.S(Sine/10)) * CF.A(M.R(40+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
	end
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.1*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(-40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+0.5*M.S(Sine/10)) * CF.A(M.R(0+-20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+-0.5*M.S(Sine/10)) * CF.A(M.R(0+20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')

elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-15)),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(15)),.2,'Lerp')
Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT JUMP LERPS
]]
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-45)+idk),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(45)-idk),.2,'Lerp')

Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')

Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT FALL LERPS
]]
end
end	

fwait()
end
end

doll2=function()
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 5100144397 meowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeowmeow")
game.StarterGui:SetCore("SendNotification",{
	Title = "meowhook | Doll";
	Text = "It is recommended to not wear any hats"
})
getgenv().Options = {
	["Jitteryness"] = Vector3.new(30.5,0,0), -- Velocity
	["Jitterless"] = true, -- Very Small Jitter, Smaller Delay
	["Type"] = "Raw", -- Raw (Simple), Fling, Bullet, Godmode
	["InstantBullet"] = {
		["Bool"] = true, -- Enables it
		["SmartLock"] = true -- Locks Bullet On Head On Hold; Disables "Bullet Follow Pointer" Thingy on hold.
	}, -- Type has to be Bullet/Godmode
	["R15Method"] = "Align", -- Align,AlignMax Or CFrame
	["R6Method"] = "Align", -- Align,AlignMax Or CFrame
	["BonusProperties"] = true, -- Net, and other stuff.
	["RigAnimations"] = true, -- Enables Default Animate
	["LoadLibrary"] = false, -- Loads LoadLibrary for scripts that still use it.
	["Logging"] = false -- Enables logging (prints debug information in console)
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/StrokeThePea/CatwareReanimate/main/src/Source.lua"))()

task.wait(2)

DoingAction = false
ActionType = 0
game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(kai)
	key = kai:lower()
	if key == "q" then
		DoingAction = false
		ActionType = 0
    elseif key == "e" then
        DoingAction = true
        ActionType = 1
	end
end)
local S =setmetatable({},{__index=function(s,i)local serv = select(2,pcall(game.GetService,game,i))if(serv)then rawset(s,i,serv) return serv end end})
local RNG = (function()
local R=Random.new()
return function(min,max,intOrDivider)
local min=min or 0
local max=max or 1

if(typeof(intOrDivider)=='number')then
return R:NextInteger(min,max)/intOrDivider
else
if(intOrDivider)then
return R:NextInteger(min,max)
else
return R:NextNumber(min,max)
end
end
end
end)()

local Camera = workspace.Camera
local M = {R=math.rad;RNG=RNG;RRNG=function(...)return math.rad(RNG(...))end;P=math.pi;C=math.clamp;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local C3 = {N=Color3.new;RGB=Color3.fromRGB;HSV=function(...)local data={...}if(typeof(data[1])=='Color3')then return Color3:ToHSV(...)else return Color3.fromHSV(...)end;end;}
local V3 = {N=Vector3.new};
local IN = Instance.new;
local R3 = Region3.new
local Plr = game.Players.LocalPlayer
local PlrGui = Plr:FindFirstChildOfClass'PlayerGui'
local Char = Plr.Character;
local Hum = Char:FindFirstChildOfClass'Humanoid'
assert(Hum and Hum.RigType==Enum.HumanoidRigType.R6,"You need to have a Humanoid and be R6.")
local RArm = Char:WaitForChild'Right Arm'
local LArm = Char:WaitForChild'Left Arm'
local Torso = Char:WaitForChild'Torso'
local RLeg = Char:WaitForChild'Right Leg'
local LLeg = Char:WaitForChild'Left Leg'
local Head = Char:WaitForChild'Head'
local Root = Char:WaitForChild'HumanoidRootPart'
local NeutralAnims = true; -- for later
local Attack = false; -- for later
local Joints = {}
local Sine = 0
local Change = 1
local CamCFrame=CFrame.new()


function Joint(name,part0,part1,c0,c1,type)
local joint = IN(type or "Motor6D")
joint.Part0 = part0
joint.Part1 = part1
joint.C0 = c0 or CF.N()
joint.C1 = c1 or CF.N()
joint.Parent=part0
joint.Name=name or part0.." to "..part1.." "..joint.ClassName
return joint
end

function NewInstance(instance,parent,properties)if(properties.Parent)then properties.Parent=parent end;local new = IN(instance)if(properties)then for prop,val in next, properties do pcall(function() new[prop]=val end)end;end;new.Parent=parent;return new;end



local WalkSpeed = 16


function GetJoint(joint)
for i,v in next, Joints do
if(i==joint or v.J==joint)then
return v,i;
end
end	
return nil;
end

function getLength(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
function getFirstEntry(table)for i,v in next,table do return i,v end;return nil;end

function Animate(joint,props,alpha,style,dir)
local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
local propName='C0'
if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
propName,props=getFirstEntry(props)
end

if(style=='Lerp' and props.lerp)then
joint[propName] = joint[propName]:lerp(props,alpha)
else
if(typeof(props)=='CFrame')then
props={C0=props}
end
local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
local tween = S.TweenService:Create(joint,info,props)
tween:Play();
return tween;
end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
local Timeframe = 0;
local LastFrame= 0;

local FPS = 60
AHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
Timeframe = Timeframe + s
if(Timeframe >= 1/FPS)then
for i = 1, math.floor(Timeframe/(1/FPS)) do
AHB:Fire()
end
LastFrame = tick()
Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
end
end)
end

function fwait(Frames)
for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames)do
AHB.Event:wait()
end
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
v:Stop();
end

pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

function Tween(object,properties,time,style,dir,repeats,reverse,delay)
local info = TweenInfo.new(time or 1,style or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,repeats or 0,reverse or false,delay or 0)
local tween = S.TweenService:Create(object,info,properties)
tween:Play()
return tween;
end

local function numLerp(Start,Finish,Alpha)
return Start + (Finish- Start) * Alpha
end

function IsValidEnum(val,enum,def)
local enum = Enum[tostring(enum)]
local succ,err=pcall(function() return enum[val.Name] end)
if(not err)then
return val
else
return def
end
end

function IsValid(val,type,def)
if(typeof(type)=='string')then
return (typeof(val)==type and val or def)
elseif(typeof(type)=='table')then
for i,v in next, type do
if(typeof(val)==v)then
return val
end
end
end
return def
end

function GetKeyframe(sequence,currentTime,lifeTime)
local scale = currentTime/lifeTime
for i = 1,#sequence.Keypoints do
local keyframe = sequence.Keypoints[i]
local nframe = sequence.Keypoints[i+1]
if(not nframe or keyframe.Time>=scale and keyframe.Time<nframe.Time)then
return keyframe
end
end
return sequence.Keypoints[1];
end;

function CastRay(startPos,endPos,range,ignoreList)
local ray = Ray.new(startPos,(endPos-startPos).unit*range)
local part,pos,norm = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList or {Char},false,true)
return part,pos,norm,(pos and (startPos-pos).magnitude)
end

while true do
Sine=Sine+Change
local Walking = Hum.MoveDirection.magnitude>0
local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
local Direction = Root.CFrame:ToObjectSpace(CamCFrame).lookVector.unit
local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
local Vec = {
X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16),
Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)
};
local Divide = 1
if(Vec.Z<0)then
Divide=math.clamp(-(1.25*Vec.Z),1,2)
end
Vec.Z = Vec.Z/Divide
Vec.X = Vec.X/Divide
Hum.WalkSpeed = WalkSpeed/Divide
local WsFactor = 6/(WalkSpeed/16)
if(NeutralAnims)then	
if(State == 'Idle') and DoingAction == false then
local Alpha = .2
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.1*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(-40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
elseif(State == 'Idle') and DoingAction == true then
	if ActionType == 1 then
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.1*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),-2+0*M.S(Sine/24), -2+1*M.S(Sine/10)) * CF.A(M.R(-90+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('RS',CF.N(1+0*M.S(Sine/24),-0.2+0*M.S(Sine/24), -1+1*M.S(Sine/10)) * CF.A(M.R(40+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('LS',CF.N(-1+0*M.S(Sine/24),-0.2+0*M.S(Sine/24), -1+1*M.S(Sine/10)) * CF.A(M.R(40+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/24),-1.95+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
	end
elseif(State == 'Walk')then
local Alpha = .3*(Hum.WalkSpeed/16)
Animate('RJ',CF.N(0+0*M.S(Sine/24),0+0.1*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('NK',CF.N(0+0*M.S(Sine/24),1.45+0*M.S(Sine/24), 0+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RS',CF.N(1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(-40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('LS',CF.N(-1+0*M.S(Sine/24),0.5+0.2*M.S(Sine/24), 1+0*M.S(Sine/24)) * CF.A(M.R(0+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(40+0*M.S(Sine/24))),0.2,'Lerp')
Animate('RH',CF.N(0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+0.5*M.S(Sine/10)) * CF.A(M.R(0+-20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')
Animate('LH',CF.N(-0.45+0*M.S(Sine/10),-1.95+0*M.S(Sine/24), 0+-0.5*M.S(Sine/10)) * CF.A(M.R(0+20*M.S(Sine/10)), M.R(0+0*M.S(Sine/24)) ,M.R(0+0*M.S(Sine/10))),0.2,'Lerp')

elseif(State == 'Jump')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-15)),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(15)),.2,'Lerp')
Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT JUMP LERPS
]]
elseif(State == 'Fall')then
local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
--[[
Animate('LS',Joints.LS.D.C0*CF.A(M.R(-5),0,M.R(-45)+idk),.2,'Lerp')
Animate('RS',Joints.RS.D.C0*CF.A(M.R(-5),0,M.R(45)-idk),.2,'Lerp')

Animate('RJ',Joints.RJ.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')
Animate('NK',Joints.NK.D.C0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),.2,'Lerp')

Animate('LH',Joints.LH.D.C0*CF.A(0,0,M.R(-5)),.2,'Lerp')
Animate('RH',Joints.RH.D.C0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),.2,'Lerp')

-- DEFAULT FALL LERPS
]]
end
end	

fwait()
end
end

library=loadstring(game:HttpGet("https://github.com/GoHamza/AppleLibrary/blob/main/main.lua?raw=true"))()
window=library:init('meowhook.cat',true,Enum.KeyCode.RightAlt,true)
reanimate=window:Section('reanimate')
reanimate:Divider('universal')
reanimate:Button('chill void',function()
	chillvoid1()
end)
reanimate:Button('among us',function()
	amongus1()
end)
reanimate:Button('doll',function()
	doll1()
end)
reanimate:Divider('just a baseplate')
reanimate:Button('chill void',function()
	chillvoid2()
end)
reanimate:Button('among us',function()
	amongus2()
end)
reanimate:Button('doll',function()
	doll2()
end)
