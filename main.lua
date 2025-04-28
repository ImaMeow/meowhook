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
local FBIBanisher = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local TextLabel_7 = Instance.new("TextLabel")

--Properties:

meowhook.Name = game:GetService("HttpService"):GenerateGUID(true)
meowhook.Parent = game.CoreGui
meowhook.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
meowhook.ResetOnSpawn = false

Mainframe.Name = "Mainframe"
Mainframe.Parent = meowhook
Mainframe.BackgroundColor3 = Color3.fromRGB(48,52,70)
Mainframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
Mainframe.BorderSizePixel = 0
Mainframe.Position = UDim2.new(0.345660388, 0, 0.208845213, 0)
Mainframe.Size = UDim2.new(0, 409, 0, 434)
Mainframe.Active = true
Mainframe.Draggable = true

TextLabel.Parent = Mainframe
TextLabel.BackgroundColor3 = Color3.fromRGB(198, 208, 245)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.00244498788, 0, 0.344036698, 0)
TextLabel.Size = UDim2.new(0, 409, 0, 22)
TextLabel.Font = Enum.Font.GothamMedium
TextLabel.Text = "Scripts"
TextLabel.TextColor3 = Color3.fromRGB(198,208,245)
TextLabel.TextSize = 18.000
TextLabel.TextTransparency = 0.100

TextLabel_2.Parent = Mainframe
TextLabel_2.BackgroundColor3 = Color3.fromRGB(198, 208, 245)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(-0.00244498788, 0, 0.0963302776, 0)
TextLabel_2.Size = UDim2.new(0, 409, 0, 22)
TextLabel_2.Font = Enum.Font.GothamMedium
TextLabel_2.Text = "Reanimate"
TextLabel_2.TextColor3 = Color3.fromRGB(198,208,245)
TextLabel_2.TextSize = 18.000
TextLabel_2.TextTransparency = 0.100

TextLabel_3.Parent = Mainframe
TextLabel_3.BackgroundColor3 = Color3.fromRGB(198, 208, 245)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(-0.23, 0, 0, 0)
TextLabel_3.Size = UDim2.new(0, 409, 0, 22)
TextLabel_3.Font = Enum.Font.GothamMedium
TextLabel_3.Text = "meowhook N4QHD7v2qE"
TextLabel_3.TextColor3 = Color3.fromRGB(198,208,245)
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
StopReanimate.BackgroundColor3 = Color3.fromRGB(98,104,128)
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
TextLabel_4.BackgroundColor3 = Color3.fromRGB(198,208,245)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.0756800994, 0, 0.127580643, 0)
TextLabel_4.Size = UDim2.new(0, 100, 0, 22)
TextLabel_4.Font = Enum.Font.GothamMedium
TextLabel_4.Text = "Stop Reanimate"
TextLabel_4.TextColor3 = Color3.fromRGB(198,208,245)
TextLabel_4.TextSize = 18.000
TextLabel_4.TextTransparency = 0.100

RunReanimate.Name = "Run Reanimate"
RunReanimate.Parent = Mainframe
RunReanimate.BackgroundColor3 = Color3.fromRGB(98,104,128)
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
TextLabel_5.TextColor3 = Color3.fromRGB(198,208,245)
TextLabel_5.TextSize = 18.000
TextLabel_5.TextTransparency = 0.100

UICorner_3.Parent = Mainframe

AnimationMan.Name = "Animation Man"
AnimationMan.Parent = Mainframe
AnimationMan.BackgroundColor3 = Color3.fromRGB(98,104,128)
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
TextLabel_6.TextColor3 = Color3.fromRGB(198,208,245)
TextLabel_6.TextSize = 18.000
TextLabel_6.TextTransparency = 0.100

FBIBanisher.Name = "FBI Banisher"
FBIBanisher.Parent = Mainframe
FBIBanisher.BackgroundColor3 = Color3.fromRGB(98,104,128)
FBIBanisher.BorderColor3 = Color3.fromRGB(0, 0, 0)
FBIBanisher.BorderSizePixel = 0
FBIBanisher.Position = UDim2.new(0.261613697, 0, 0.508064508, 0)
FBIBanisher.Size = UDim2.new(0, 192, 0, 32)
FBIBanisher.Font = Enum.Font.SourceSans
FBIBanisher.Text = ""
FBIBanisher.TextColor3 = Color3.fromRGB(0, 0, 0)
FBIBanisher.TextSize = 14.000
FBIBanisher.MouseButton1Click:Connect(function()
	if not Running then
		game.StarterGui:SetCore("SendNotification",{
			Title = "meowhook V2";
			Text = "Please have reanimate running!"
		})
		return
	end
	local Player = game.Players.LocalPlayer
	PlayerGui = Player.PlayerGui
	Cam = workspace.CurrentCamera
	Backpack = Player.Backpack
	Character = Empyrean.Rig
	Humanoid = Character.Humanoid
	RootPart = Character["HumanoidRootPart"]
	Torso = Character["Torso"]
	Head = Character["Head"]
	RightArm = Character["Right Arm"]
	LeftArm = Character["Left Arm"]
	RightLeg = Character["Right Leg"]
	LeftLeg = Character["Left Leg"]
	RootJoint = RootPart["RootJoint"]
	Neck = Torso["Neck"]
	RightShoulder = Torso["Right Shoulder"]
	LeftShoulder = Torso["Left Shoulder"]
	RightHip = Torso["Right Hip"]
	LeftHip = Torso["Left Hip"]
	local TIME = 0
	local sick = Instance.new("Sound",Torso)
	Mouse = Player:GetMouse()
	mouse = Mouse

	function CreateWeapon(Name)
		local Part = Instance.new("Part")
		Part.Name = Name
		Part.CanCollide = false
		Part.Transparency = 1
		Part.Parent = Player.Character
	end

	function WeldWeapon(Part0, Part1)
		local Weld = Instance.new("Weld")
		Weld.Part0 = Part0
		Weld.Part1 = Part1
		Weld.Parent = Player.Character
	end

	CreateWeapon("Gun")
	WeldWeapon(Player.Character.Gun, RightArm)

	IT = Instance.new
	CF = CFrame.new
	VT = Vector3.new
	RAD = math.rad
	C3 = Color3.new
	UD2 = UDim2.new
	BRICKC = BrickColor.new
	ANGLES = CFrame.Angles
	EULER = CFrame.fromEulerAnglesXYZ
	COS = math.cos
	ACOS = math.acos
	SIN = math.sin
	ASIN = math.asin
	ABS = math.abs
	MRANDOM = math.random
	FLOOR = math.floor

	--//=================================\\
	--|| 	      USEFUL VALUES
	--\\=================================//

	Animation_Speed = 3
	local FORCERESET = false
	Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
	local Speed = 16
	local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
	local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
	local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
	local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
	local DAMAGEMULTIPLIER = 1
	local ANIM = "Idle"
	local ATTACK = false
	local EQUIPPED = false
	local HOLD = false
	local COMBO = 1
	local Rooted = false
	local SINE = 0
	local KEYHOLD = false
	local CHANGE = 2 / Animation_Speed
	local WALKINGANIM = false
	local VALUE1 = false
	local VALUE2 = false
	local Player_Size = 1
	local ROBLOXIDLEANIMATION = IT("Animation")
	ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
	ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
	--ROBLOXIDLEANIMATION.Parent = Humanoid
	local WEAPONGUI = IT("ScreenGui", Player.PlayerGui)
	WEAPONGUI.Name = "BanishV3Gui"
	local Weapon = IT("Model")
	Weapon.Name = "Adds"
	local Effects = IT("Folder", Weapon)
	Effects.Name = "Effects"
	local Weapon2 = IT("Model")
	Weapon2.Name = "Adds"
	local Effects = IT("Folder", Weapon2)
	Effects.Name = "Effects"
	local Weapon3 = IT("Model")
	Weapon3.Name = "Adds"
	local Effects = IT("Folder", Weapon2)
	Effects.Name = "Effects"
	local ANIMATOR = Humanoid.Animator
	local ANIMATE = Character:FindFirstChild("Animate")
	local UNANCHOR = true
	local TOBANISH = {}
	local sick = Instance.new("Sound",Character)
	sick.Parent = Torso
	sick.Playing = true
	sick.Looped = true
	sick.Volume = 1
	sick.Pitch = 0.9
	sick.TimePosition = 25
	sick.SoundId = "rbxassetid://1534595017"

	--//=================================\\
	--\\=================================//


	--//=================================\\
	--|| SAZERENOS' ARTIFICIAL HEARTBEAT
	--\\=================================//

	ArtificialHB = Instance.new("BindableEvent", Character)
	ArtificialHB.Name = "ArtificialHB"

	Character:WaitForChild("ArtificialHB")

	frame = Frame_Speed
	tf = 0
	allowframeloss = false
	tossremainder = false
	lastframe = tick()
	Character.ArtificialHB:Fire()

	game:GetService("RunService").Heartbeat:connect(function(s, p)
		tf = tf + s
		if tf >= frame then
			if allowframeloss then
				Character.ArtificialHB:Fire()
				lastframe = tick()
			else
				for i = 1, math.floor(tf / frame) do
					Character.ArtificialHB:Fire()
				end
				lastframe = tick()
			end
			if tossremainder then
				tf = 0
			else
				tf = tf - frame * math.floor(tf / frame)
			end
		end
	end)

	--//=================================\\
	--\\=================================//

	--//=================================\\
	--|| 	      SOME FUNCTIONS
	--\\=================================//

	function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
		return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
	end

	function PositiveAngle(NUMBER)
		if NUMBER >= 0 then
			NUMBER = 0
		end
		return NUMBER
	end

	function NegativeAngle(NUMBER)
		if NUMBER <= 0 then
			NUMBER = 0
		end
		return NUMBER
	end

	function Swait(NUMBER)
		if NUMBER == 0 or NUMBER == nil then
			ArtificialHB.Event:wait()
		else
			for i = 1, NUMBER do
				ArtificialHB.Event:wait()
			end
		end
	end

	function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
		local NEWMESH = IT(MESH)
		if MESH == "SpecialMesh" then
			NEWMESH.MeshType = MESHTYPE
			if MESHID ~= "nil" and MESHID ~= "" then
				NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
			end
			if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
				NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
			end
		end
		NEWMESH.Offset = OFFSET or VT(0, 0, 0)
		NEWMESH.Scale = SCALE
		NEWMESH.Parent = PARENT
		return NEWMESH
	end

	function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
		local NEWPART = IT("Part")
		NEWPART.formFactor = FORMFACTOR
		NEWPART.Reflectance = REFLECTANCE
		NEWPART.Transparency = TRANSPARENCY
		NEWPART.CanCollide = false
		NEWPART.Locked = true
		NEWPART.Anchored = true
		if ANCHOR == false then
			NEWPART.Anchored = false
		end
		NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
		NEWPART.Name = NAME
		NEWPART.Size = SIZE
		NEWPART.Position = Torso.Position
		NEWPART.Material = MATERIAL
		NEWPART:BreakJoints()
		NEWPART.Parent = PARENT
		return NEWPART
	end

	local function weldBetween(a, b)
		local weldd = Instance.new("ManualWeld")
		weldd.Part0 = a
		weldd.Part1 = b
		weldd.C0 = CFrame.new()
		weldd.C1 = b.CFrame:inverse() * a.CFrame
		weldd.Parent = a
		return weldd
	end


	function QuaternionFromCFrame(cf)
		local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
		local trace = m00 + m11 + m22
		if trace > 0 then 
			local s = math.sqrt(1 + trace)
			local recip = 0.5 / s
			return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
		else
			local i = 0
			if m11 > m00 then
				i = 1
			end
			if m22 > (i == 0 and m00 or m11) then
				i = 2
			end
			if i == 0 then
				local s = math.sqrt(m00 - m11 - m22 + 1)
				local recip = 0.5 / s
				return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
			elseif i == 1 then
				local s = math.sqrt(m11 - m22 - m00 + 1)
				local recip = 0.5 / s
				return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
			elseif i == 2 then
				local s = math.sqrt(m22 - m00 - m11 + 1)
				local recip = 0.5 / s return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
			end
		end
	end

	function QuaternionToCFrame(px, py, pz, x, y, z, w)
		local xs, ys, zs = x + x, y + y, z + z
		local wx, wy, wz = w * xs, w * ys, w * zs
		local xx = x * xs
		local xy = x * ys
		local xz = x * zs
		local yy = y * ys
		local yz = y * zs
		local zz = z * zs
		return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
	end

	function QuaternionSlerp(a, b, t)
		local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
		local startInterp, finishInterp;
		if cosTheta >= 0.0001 then
			if (1 - cosTheta) > 0.0001 then
				local theta = ACOS(cosTheta)
				local invSinTheta = 1 / SIN(theta)
				startInterp = SIN((1 - t) * theta) * invSinTheta
				finishInterp = SIN(t * theta) * invSinTheta
			else
				startInterp = 1 - t
				finishInterp = t
			end
		else
			if (1 + cosTheta) > 0.0001 then
				local theta = ACOS(-cosTheta)
				local invSinTheta = 1 / SIN(theta)
				startInterp = SIN((t - 1) * theta) * invSinTheta
				finishInterp = SIN(t * theta) * invSinTheta
			else
				startInterp = t - 1
				finishInterp = t
			end
		end
		return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
	end

	function Clerp(a, b, t)
		local qa = {QuaternionFromCFrame(a)}
		local qb = {QuaternionFromCFrame(b)}
		local ax, ay, az = a.x, a.y, a.z
		local bx, by, bz = b.x, b.y, b.z
		local _t = 1 - t
		return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
	end

	function CreateFrame(PARENT, TRANSPARENCY, BORDERSIZEPIXEL, POSITION, SIZE, COLOR, BORDERCOLOR, NAME)
		local frame = IT("Frame")
		frame.BackgroundTransparency = TRANSPARENCY
		frame.BorderSizePixel = BORDERSIZEPIXEL
		frame.Position = POSITION
		frame.Size = SIZE
		frame.BackgroundColor3 = COLOR
		frame.BorderColor3 = BORDERCOLOR
		frame.Name = NAME
		frame.Parent = PARENT
		return frame
	end

	function CreateLabel(PARENT, TEXT, TEXTCOLOR, TEXTFONTSIZE, TEXTFONT, TRANSPARENCY, BORDERSIZEPIXEL, STROKETRANSPARENCY, NAME)
		local label = IT("TextLabel")
		label.BackgroundTransparency = 1
		label.Size = UD2(1, 0, 1, 0)
		label.Position = UD2(0, 0, 0, 0)
		label.TextColor3 = TEXTCOLOR
		label.TextStrokeTransparency = STROKETRANSPARENCY
		label.TextTransparency = TRANSPARENCY
		label.FontSize = TEXTFONTSIZE
		label.Font = TEXTFONT
		label.BorderSizePixel = BORDERSIZEPIXEL
		label.TextScaled = false
		label.Text = TEXT
		label.Name = NAME
		label.Parent = PARENT
		return label
	end

	function NoOutlines(PART)
		PART.TopSurface, PART.BottomSurface, PART.LeftSurface, PART.RightSurface, PART.FrontSurface, PART.BackSurface = 10, 10, 10, 10, 10, 10
	end

	function CreateWeldOrSnapOrMotor(TYPE, PARENT, PART0, PART1, C0, C1)
		local NEWWELD = IT(TYPE)
		NEWWELD.Part0 = PART0
		NEWWELD.Part1 = PART1
		NEWWELD.C0 = C0
		NEWWELD.C1 = C1
		NEWWELD.Parent = PARENT
		return NEWWELD
	end

	local S = IT("Sound")
	function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
		local NEWSOUND = nil
		coroutine.resume(coroutine.create(function()
			NEWSOUND = S:Clone()
			NEWSOUND.Parent = PARENT
			NEWSOUND.Volume = VOLUME
			NEWSOUND.Pitch = PITCH
			NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
			NEWSOUND:play()
			if DOESLOOP == true then
				NEWSOUND.Looped = true
			else
				repeat wait(1) until NEWSOUND.Playing == false or NEWSOUND.Parent ~= PARENT
				NEWSOUND:remove()
			end
		end))
		return NEWSOUND
	end

	function CFrameFromTopBack(at, top, back)
		local right = top:Cross(back)
		return CF(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
	end

	--WACKYEFFECT({EffectType = "", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	function WACKYEFFECT(Table)
		local TYPE = (Table.EffectType or "Sphere")
		local SIZE = (Table.Size or VT(1,1,1))
		local ENDSIZE = (Table.Size2 or VT(0,0,0))
		local TRANSPARENCY = (Table.Transparency or 0)
		local ENDTRANSPARENCY = (Table.Transparency2 or 1)
		local CFRAME = (Table.CFrame or Torso.CFrame)
		local MOVEDIRECTION = (Table.MoveToPos or nil)
		local ROTATION1 = (Table.RotationX or 0)
		local ROTATION2 = (Table.RotationY or 0)
		local ROTATION3 = (Table.RotationZ or 0)
		local MATERIAL = (Table.Material or "Neon")
		local COLOR = (Table.Color or C3(1,1,1))
		local TIME = (Table.Time or 45)
		local SOUNDID = (Table.SoundID or nil)
		local SOUNDPITCH = (Table.SoundPitch or nil)
		local SOUNDVOLUME = (Table.SoundVolume or nil)
		coroutine.resume(coroutine.create(function()
			local PLAYSSOUND = false
			local SOUND = nil
			local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
			if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
				PLAYSSOUND = true
				SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
			end
			EFFECT.Color = COLOR
			local MSH = nil
			if TYPE == "Sphere" then
				MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
			elseif TYPE == "Block" then
				MSH = IT("BlockMesh",EFFECT)
				MSH.Scale = VT(SIZE.X,SIZE.X,SIZE.X)
			elseif TYPE == "Wave" then
				MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
			elseif TYPE == "Ring" then
				MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
			elseif TYPE == "Slash" then
				MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
			elseif TYPE == "Round Slash" then
				MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
			elseif TYPE == "Swirl" then
				MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "1051557", "", SIZE, VT(0,0,0))
			elseif TYPE == "Skull" then
				MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
			elseif TYPE == "Crystal" then
				MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
			end
			if MSH ~= nil then
				local MOVESPEED = nil
				if MOVEDIRECTION ~= nil then
					MOVESPEED = (CFRAME.p - MOVEDIRECTION).Magnitude/TIME
				end
				local GROWTH = SIZE - ENDSIZE
				local TRANS = TRANSPARENCY - ENDTRANSPARENCY
				if TYPE == "Block" then
					EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
				else
					EFFECT.CFrame = CFRAME
				end
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.X/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
						EFFECT.Orientation = ORI
					end
				end
				if PLAYSSOUND == false then
					EFFECT:remove()
				else
					SOUND.Stopped:Connect(function()
						EFFECT:remove()
					end)
				end
			else
				if PLAYSSOUND == false then
					EFFECT:remove()
				else
					repeat Swait() until SOUND.Playing == false
					EFFECT:remove()
				end
			end
		end))
	end

	function MakeForm(PART,TYPE)
		if TYPE == "Cyl" then
			local MSH = IT("CylinderMesh",PART)
		elseif TYPE == "Ball" then
			local MSH = IT("SpecialMesh",PART)
			MSH.MeshType = "Sphere"
		elseif TYPE == "Wedge" then
			local MSH = IT("SpecialMesh",PART)
			MSH.MeshType = "Wedge"
		end
	end

	function SpawnTrail(FROM,TO,BIG)
		local TRAIL = CreatePart(3, Effects, "Neon", 0, 0.5, "Really red", "Trail", VT(0,0,0))
		MakeForm(TRAIL,"Cyl")
		local DIST = (FROM - TO).Magnitude
		if BIG == true then
			TRAIL.Size = VT(0.5,DIST,0.5)
		else
			TRAIL.Size = VT(0.25,DIST,0.25)
		end
		TRAIL.CFrame = CF(FROM, TO) * CF(0, 0, -DIST/2) * ANGLES(RAD(90),RAD(0),RAD(0))
		coroutine.resume(coroutine.create(function()
			for i = 1, 5 do
				Swait()
				TRAIL.Transparency = TRAIL.Transparency + 0.1
			end
			TRAIL:remove()
		end))
	end

	function Slice(KIND,SIZE,WAIT,CFRAME,COLOR,GROW)
		local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(COLOR), "Effect", VT(1,1,1), true)
		local mesh = nil
		if KIND == "Base" then
			mesh = CreateMesh("SpecialMesh", wave, "FileMesh", "448386996", "", VT(0,SIZE/10,SIZE/10), VT(0,0,0))
		elseif KIND == "Thin" then
			mesh = CreateMesh("SpecialMesh", wave, "FileMesh", "662586858", "", VT(SIZE/10,0,SIZE/10), VT(0,0,0))
		elseif KIND == "Round" then
			mesh = CreateMesh("SpecialMesh", wave, "FileMesh", "662585058", "", VT(SIZE/10,0,SIZE/10), VT(0,0,0))
		end
		wave.CFrame = CFRAME
		coroutine.resume(coroutine.create(function(PART)
			for i = 1, WAIT do
				Swait()
				mesh.Scale = mesh.Scale + GROW/10
				wave.Transparency = wave.Transparency + (0.5/WAIT)
				if wave.Transparency > 0.99 then
					wave:remove()
				end
			end
		end))
	end

	function Epic(SHAKE,TIMER)
		coroutine.resume(coroutine.create(function()
			local FADER = SHAKE/TIMER
			for i = 1, TIMER do
				wait()
				Humanoid.CameraOffset = VT(MRANDOM(-(SHAKE-(FADER*i)),(SHAKE-(FADER*i)))/10,MRANDOM(-(SHAKE-(FADER*i)),(SHAKE-(FADER*i)))/10,MRANDOM(-(SHAKE-(FADER*i)),(SHAKE-(FADER*i)))/10)
			end
			Humanoid.CameraOffset = VT(0,0,0)
		end))
	end

	Debris = game:GetService("Debris")

	function CastProperRay(StartPos, EndPos, Distance, Ignore)
		local DIRECTION = CF(StartPos,EndPos).lookVector
		return Raycast(StartPos, DIRECTION, Distance, Ignore)
	end

	function turnto(position)
		RootPart.CFrame=CFrame.new(RootPart.CFrame.p,VT(position.X,RootPart.Position.Y,position.Z)) * CFrame.new(0, 0, 0)
	end

	--//=================================\\
	--||	     WEAPON CREATION
	--\\=================================//

	local Particle = IT("ParticleEmitter",nil)
	Particle.Enabled = false
	Particle.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.3),NumberSequenceKeypoint.new(0.3,0),NumberSequenceKeypoint.new(1,1)})
	Particle.LightEmission = 0.5
	Particle.Rate = 150
	Particle.ZOffset = 0.2
	Particle.Rotation = NumberRange.new(-180, 180)
	Particle.RotSpeed = NumberRange.new(-180, 180)
	Particle.Texture = "http://www.roblox.com/asset/?id=304437537"
	Particle.Color = ColorSequence.new(C3(1,0,0),C3(0.4,0,0))

	--ParticleEmitter({Speed = 5, Drag = 0, Size1 = 1, Size2 = 5, Lifetime1 = 1, Lifetime2 = 1.5, Parent = Torso, Emit = 100, Offset = 360, Enabled = false})
	function ParticleEmitter(Table)
		local PRTCL = Particle:Clone()
		local Speed = Table.Speed or 5
		local Drag = Table.Drag or 0
		local Size1 = Table.Size1 or 1
		local Size2 = Table.Size2 or 5
		local Lifetime1 = Table.Lifetime1 or 1
		local Lifetime2 = Table.Lifetime2 or 1.5
		local Parent = Table.Parent or Torso
		local Emit = Table.Emit or 100
		local Offset = Table.Offset or 360
		local Acel = Table.Acel or VT(0,0,0)
		local Enabled = Table.Enabled or false
		PRTCL.Parent = Parent
		PRTCL.Size = NumberSequence.new(Size1,Size2)
		PRTCL.Lifetime = NumberRange.new(Lifetime1,Lifetime2)
		PRTCL.Speed = NumberRange.new(Speed)
		PRTCL.VelocitySpread = Offset
		PRTCL.Drag = Drag
		PRTCL.Acceleration = Acel
		if Enabled == false then
			PRTCL:Emit(Emit)
			Debris:AddItem(PRTCL,Lifetime2)
		else
			PRTCL.Enabled = true
		end
		return PRTCL
	end

	armor = Instance.new("Part")
	armormesh = Instance.new("SpecialMesh")
	armor.Anchored = false
	armor.CanCollide = false
	armor.Size = Vector3.new(1.4, 0.7, 1.3)
	armor.BrickColor = BrickColor.new("Black")
	armor.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
	armor.Material = Enum.Material.SmoothPlastic
	armor.Color = Color3.new(0.105882, 0.164706, 0.207843)
	armor.RightSurface = Enum.SurfaceType.SmoothNoOutlines
	armor.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
	armor.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
	armor.BackSurface = Enum.SurfaceType.SmoothNoOutlines
	armor.TopSurface = Enum.SurfaceType.SmoothNoOutlines
	armor.Parent = Character
	armor.CFrame = CFrame.new(-87.19, 0.42, -26.37) * CFrame.Angles(0, 0, 0)
	armormesh.MeshId = "rbxassetid://840131767"
	armormesh.MeshType = Enum.MeshType.FileMesh
	armormesh.Parent = armor
	local wlf4 = Instance.new("Weld",armor)
	wlf4.Part0 = armor
	wlf4.Part1 = Torso
	wlf4.C0 = wlf4.C0 * CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))
	wlf4.C1 = CFrame.new(0,0,0)


	local BC = Character["Body Colors"]
	BC.HeadColor = BrickColor.new("Really black")
	BC.LeftArmColor = BrickColor.new("Really black")
	BC.LeftLegColor = BrickColor.new("Really black")
	BC.RightArmColor = BrickColor.new("Really black")
	BC.RightLegColor = BrickColor.new("Really black")
	BC.TorsoColor = BrickColor.new("Really black")


	Humanoid.MaxHealth = math.huge



	local Gun = CreatePart(3, Character, "Neon", 0, 0, "Really white", "Gun", VT(0, 0, 0),false)
	Gun.Transparency = 1
	local HandleMesh = CreateMesh("SpecialMesh", Gun, "FileMesh", "468351345", "468351348", VT(0.06,0.06,0.06), VT(0,0, 0))
	local Weld = CreateWeldOrSnapOrMotor("Weld", Gun, RightArm, Gun, CF(0, -1.8, -0.2) * ANGLES(RAD(0), RAD(90), RAD(-90)), CF(0, 0, 0))

	---

	---
	local Part = CreatePart(3, Weapon2, "Neon", 0, 0, "Mid gray", "Part", VT(0,0,0),false)

	local Part = CreatePart(3, Weapon2, "Neon", 0, 0, "Mid gray", "Part", VT(0,0,0),false)


	local Part = CreatePart(3, Weapon, "Neon", 0, 0, "Mid gray", "Part", VT(0,0,0),false)

	local Part = CreatePart(3, Weapon, "Neon", 0, 0, "Mid gray", "Part", VT(0,0,0),false)


	--ParticleEmitter({Speed = 0.5, Drag = 0, Size1 = 0.2, Size2 = 0, Lifetime1 = 0.3, Lifetime2 = 0.7, Parent = Dangle, Emit = 100, Offset = 360, Enabled = true, Acel = VT(0,5,0)})

	for _, c in pairs(Weapon:GetDescendants()) do
		if c.ClassName == "Part" and c.Name ~= "Eye" and c.Parent ~= Effects and c.Parent.Parent ~= Effects then
			c.Material = "Neon"
			c.Color = C3(1,0,0)
		elseif c.ClassName == "Part" and c.Name == "Eye" then
			c.Color = C3(1,0,0)
			c.Material = "Neon"
		end
	end

	for _, c in pairs(Weapon2:GetDescendants()) do
		if c.ClassName == "Part" and c.Name ~= "Eye" and c.Parent ~= Effects and c.Parent.Parent ~= Effects then
			c.Material = "Neon"
			c.Color = C3(0,0,2)
		elseif c.ClassName == "Part" and c.Name == "Eye" then
			c.Color = C3(0,0,2)
			c.Material = "Neon"
		end
	end

	Weapon3.Parent = Character
	for _, c in pairs(Weapon3:GetChildren()) do
		if c.ClassName == "Part" then
			c.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
		end
	end

	Weapon2.Parent = Character
	for _, c in pairs(Weapon2:GetChildren()) do
		if c.ClassName == "Part" then
			c.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
		end
	end

	Weapon.Parent = Character
	for _, c in pairs(Weapon:GetChildren()) do
		if c.ClassName == "Part" then
			c.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
		end
	end

	local SKILLTEXTCOLOR = C3(1,0,0)
	local SKILLFONT = "Antique"
	local SKILLTEXTSIZE = 7

	Humanoid.Died:connect(function()
		ATTACK = true
	end)

	local SKILL1FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.1, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 1 Frame")
--[[local SKILL2FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.63, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 2 Frame")
local SKILL3FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.215, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 3 Frame")
local SKILL4FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.525, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 4 Frame")
local SKILL5FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.365, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 5 Frame")
]]
	local SKILL1TEXT = CreateLabel(SKILL1FRAME, "[Z] Banisher Bullet", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 1")
--[[local SKILL2TEXT = CreateLabel(SKILL2FRAME, "[B] Ability 2", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 2")
local SKILL3TEXT = CreateLabel(SKILL3FRAME, "[C] Ability 3", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 3")
local SKILL4TEXT = CreateLabel(SKILL4FRAME, "[V] Ability 4", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 4")
local SKILL5TEXT = CreateLabel(SKILL5FRAME, "[X] Mercy", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 5")
]]
	function printbye(Name)
		local MESSAGES = {"You cannot struggle, ","Your existance is an insult, ","Fade, ","Your existance is not desired, ","You are not permitted here, ","You are not to decide your fate, ","Be gone, ","You are already dead, ","Your live is an anomaly, ","Don't dare to return, ","Why are you resisting, ","You cannot exist here, ","Why are you struggling, ","Your fate was already decided, ","Goodbye, ","You cannot ignore my command, ","You cannot resist my command, ","You already died, "}
		warn(MESSAGES[MRANDOM(1,#MESSAGES)]..Name..".")	
	end



	--//=================================\\
	--||			DAMAGING
	--\\=================================//

	function Banish(Foe)

	end

	function ApplyAoE(POSITION,RANGE,ISBANISH)

	end

	Debris = game:GetService("Debris")

	function CastProperRay(StartPos, EndPos, Distance, Ignore)
		local DIRECTION = CF(StartPos,EndPos).lookVector
		return Raycast(StartPos, DIRECTION, Distance, Ignore)
	end

	function turnto(position)
		RootPart.CFrame=CFrame.new(RootPart.CFrame.p,VT(position.X,RootPart.Position.Y,position.Z)) * CFrame.new(0, 0, 0)
	end

	function CreateDebreeRing(FLOOR,POSITION,SIZE,BLOCKSIZE,SWAIT)
		if FLOOR ~= nil then
			coroutine.resume(coroutine.create(function()
				local PART = CreatePart(3, Effects, "Plastic", 0, 1, "Pearl", "DebreeCenter", VT(0,0,0))
				PART.CFrame = CF(POSITION)
				for i = 1, 45 do
					local RingPiece = CreatePart(3, Effects, "Plastic", 0, 0, "Pearl", "DebreePart", BLOCKSIZE)
					RingPiece.Material = FLOOR.Material
					RingPiece.Color = FLOOR.Color
					RingPiece.CFrame = PART.CFrame * ANGLES(RAD(0), RAD(i*8), RAD(0)) * CF(SIZE*4, 0, 0) * ANGLES(RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)))
					Debris:AddItem(RingPiece,SWAIT)
				end
				PART:remove()
			end))
		end
	end

	function CreateFlyingDebree(FLOOR,POSITION,AMOUNT,BLOCKSIZE,SWAIT,STRENGTH,DOES360)
		if FLOOR ~= nil then
			for i = 1, AMOUNT do
				local DEBREE = CreatePart(3, Effects, "Neon", 0, 0, "Peal", "Debree", BLOCKSIZE, false)
				DEBREE.Material = FLOOR.Material
				DEBREE.Color = FLOOR.Color
				DEBREE.CFrame = POSITION * ANGLES(RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)))
				if DOES360 == true then
					DEBREE.Velocity = VT(MRANDOM(-STRENGTH,STRENGTH),MRANDOM(-STRENGTH,STRENGTH),MRANDOM(-STRENGTH,STRENGTH))
				else
					DEBREE.Velocity = VT(MRANDOM(-STRENGTH,STRENGTH),STRENGTH,MRANDOM(-STRENGTH,STRENGTH))
				end
				coroutine.resume(coroutine.create(function()
					Swait(15)
					DEBREE.Parent = workspace
					DEBREE.CanCollide = true
					Debris:AddItem(DEBREE,SWAIT)
				end))
			end
		end
	end

	function SpawnTrail(FROM,TO)
		local TRAIL = CreatePart(3, Effects, "Neon", 0, 0.5, "Pearl", "Arrow", VT(0,0,0))
		MakeForm(TRAIL,"Cyl")
		local DIST = (FROM - TO).Magnitude
		TRAIL.Size = VT(0.1,DIST,0.1)
		TRAIL.CFrame = CF(FROM, TO) * CF(0, 0, -DIST/2) * ANGLES(RAD(90),RAD(0),RAD(0))
		coroutine.resume(coroutine.create(function()
			for i = 1, 5 do
				Swait()
				TRAIL.Transparency = TRAIL.Transparency + 0.1
			end
			TRAIL:remove()
		end))
	end

	local Decal = IT("Decal")
	function SpawnBulletHole(POSITION)
		local O1 = CreatePart(3, Effects, "Neon", 0, 1, "Really red", "Bullet hole", VT(0.2,0,0.2))
		local decal = Decal:Clone()
		decal.Parent = O1
		decal.Face = "Top"
		decal.Texture = "http://www.roblox.com/asset/?id=130624105"
		local decal2 = Decal:Clone()
		decal2.Parent = O1
		decal2.Face = "Bottom"
		decal2.Texture = "http://www.roblox.com/asset/?id=130624105"
		O1.CFrame = POSITION*ANGLES(RAD(0),RAD(MRANDOM(-180,180)),RAD(0))
		Debris:AddItem(O1,5)
	end

	function BulletDetection(FROM,TO)
		local AIMHIT,AIMPOS,NORMAL = CastProperRay(FROM,TO,2000,Character)
		coroutine.resume(coroutine.create(function()
			if AIMHIT ~= nil then
				if AIMHIT.Parent ~= Character then
					if AIMHIT.Parent:FindFirstChildOfClass("Humanoid") or AIMHIT.Parent.Parent:FindFirstChildOfClass("Humanoid") then
						if AIMHIT.Name ~= "Head" and AIMHIT.Parent.ClassName ~= "Accessory" then
							ApplyDamage(AIMHIT.Parent:FindFirstChildOfClass("Humanoid"),MRANDOM(15,25),AIMHIT)
						elseif AIMHIT.Name == "Head" or AIMHIT.Parent.ClassName == "Accessory" then
							if AIMHIT.Parent.ClassName == "Accessory" then
								if AIMHIT:FindFirstChild("HatAttachment") or AIMHIT:FindFirstChild("FaceFrontAttachment") or AIMHIT:FindFirstChild("HairAttachment") then
									if AIMHIT.Parent.Parent:FindFirstChild("Head") then
										getbloody(AIMHIT.Parent.Parent.Head,15)
										StatLabel(AIMHIT.CFrame * CF(0, 0 + (AIMHIT.Size.z - 1), 0), "Headshot!", C3(1,0,0))
									end
								else
									ApplyDamage(AIMHIT.Parent.Parent:FindFirstChildOfClass("Humanoid"),MRANDOM(25,65),AIMHIT)
								end
							elseif AIMHIT.Name == "Head" then
								getbloody(AIMHIT,15)
								StatLabel(AIMHIT.CFrame * CF(0, 0 + (AIMHIT.Size.z - 1), 0), "Headshot!", C3(1,0,0))
							end
						end
					else
						CreateFlyingDebree(AIMHIT,CF(AIMPOS),7,VT(0.1,0.1,0.1),5,35,true)
						SpawnBulletHole(CF(AIMPOS,AIMPOS+NORMAL)*ANGLES(RAD(90),RAD(0),RAD(0)))
					end
				end
			end
		end))
		return AIMHIT,AIMPOS,NORMAL
	end

	local asd = Instance.new("ParticleEmitter")
	asd.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(.5, 0, 0))
	asd.LightEmission = .1
	asd.Texture = "http://www.roblox.com/asset/?ID=291880914"
	aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2),NumberSequenceKeypoint.new(1, 2)})
	bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
	asd.Transparency = bbb
	asd.Size = aaa
	asd.ZOffset = .9
	asd.Acceleration = Vector3.new(0, -15, 0)
	asd.LockedToPart = false
	asd.EmissionDirection = "Back"
	asd.Lifetime = NumberRange.new(1, 2)
	asd.Rotation = NumberRange.new(-100, 100)
	asd.RotSpeed = NumberRange.new(-100, 100)
	asd.Speed = NumberRange.new(10)
	asd.Enabled = false
	asd.VelocitySpread = 999

	function getbloody(victim,amount)
		local PART = IT("Part",Effects)
		PART.Transparency = 1
		PART.Size = victim.Size
		PART.Anchored = true
		PART.CanCollide = false
		PART.CFrame = CF(victim.Position)
		local HITPLAYERSOUNDS = {"356551938","264486467"}
		Debris:AddItem(PART,5)
		CreateSound(HITPLAYERSOUNDS[MRANDOM(1, #HITPLAYERSOUNDS)], PART, 1, (math.random(8,12)/10))
		CreateSound(HITPLAYERSOUNDS[MRANDOM(1, #HITPLAYERSOUNDS)], PART, 1, (math.random(8,12)/10))
		CreateSound(HITPLAYERSOUNDS[MRANDOM(1, #HITPLAYERSOUNDS)], PART, 1, (math.random(8,12)/10))
		local prtcl = asd:Clone()
		prtcl.Parent = PART
		prtcl:Emit(amount*10)
	end


	function ApplyDamage(Humanoid,Damage,TorsoPart)

	end

	function AoEDamage(position,radius,min,max,maxstrength,critrate,critmultiplier,CanBeDodgedByJumping)

	end

	function MagicSphere(SIZE,WAIT,CFRAME,COLOR,GROW)
		local wave = CreatePart(3, Effects, "Neon", 0, 0, BRICKC(COLOR), "Effect", VT(1,1,1), true)
		local mesh = CreateMesh("SpecialMesh", wave, "Sphere", "", "", SIZE, VT(0,0,0))
		wave.CFrame = CFRAME
		coroutine.resume(coroutine.create(function(PART)
			for i = 1, WAIT do
				Swait()
				mesh.Scale = mesh.Scale + GROW
				wave.Transparency = wave.Transparency + (1/WAIT)
				if wave.Transparency > 0.99 then
					wave:remove()
				end
			end
		end))
	end

	function StatLabel(CFRAME, TEXT, COLOR)
		local STATPART = CreatePart(3, Effects, "SmoothPlastic", 0, 1, "Really black", "Effect", VT())
		STATPART.CFrame = CF(CFRAME.p,CFRAME.p+VT(MRANDOM(-5,5),MRANDOM(0,5),MRANDOM(-5,5)))
		local BODYGYRO = IT("BodyGyro", STATPART)
		game:GetService("Debris"):AddItem(STATPART ,5)
		local BILLBOARDGUI = Instance.new("BillboardGui", STATPART)
		BILLBOARDGUI.Adornee = STATPART
		BILLBOARDGUI.Size = UD2(2.5, 0, 2.5 ,0)
		BILLBOARDGUI.StudsOffset = VT(-2, 2, 0)
		BILLBOARDGUI.AlwaysOnTop = false
		local TEXTLABEL = Instance.new("TextLabel", BILLBOARDGUI)
		TEXTLABEL.BackgroundTransparency = 1
		TEXTLABEL.Size = UD2(2.5, 0, 2.5, 0)
		TEXTLABEL.Text = TEXT
		TEXTLABEL.Font = SKILLFONT
		TEXTLABEL.FontSize="Size42"
		TEXTLABEL.TextColor3 = COLOR
		TEXTLABEL.TextStrokeTransparency = 0
		TEXTLABEL.TextScaled = true
		TEXTLABEL.TextWrapped = true
		coroutine.resume(coroutine.create(function(THEPART, THEBODYPOSITION, THETEXTLABEL)
			for i = 1, 10 do
				Swait()
				STATPART.CFrame = STATPART.CFrame * CF(0,0,-0.2)
				TEXTLABEL.TextTransparency = TEXTLABEL.TextTransparency + (1/10)
				TEXTLABEL.TextStrokeTransparency = TEXTLABEL.TextTransparency
			end
			THEPART.Parent = nil
		end),STATPART, TEXTLABEL)
	end


	--//=================================\\
	--||	ATTACK FUNCTIONS AND STUFF
	--\\=================================//

	function Shot()
		ATTACK = true
		Rooted = false
		local GYRO = IT("BodyGyro",RootPart)
		GYRO.D = 750
		GYRO.P = 20000
		GYRO.MaxTorque = VT(0,40000000,0)
		repeat
			for i=0, 0.5, 0.1 / Animation_Speed do
				Swait()
				turnto(Mouse.Hit.p)
				GYRO.cframe = CF(RootPart.Position,Mouse.Hit.p)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 - 0.1 * COS(SINE / 18)) * ANGLES(RAD(0), RAD(0), RAD(70)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 18)), RAD(0), RAD(-70)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(0), RAD(70)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 - 0.1 * COS(SINE / 18), 0) * ANGLES(RAD(0), RAD(0 - -10.5 * SIN(SINE / 16)), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.1 * COS(SINE / 18), -0.01) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 + 0.1 * COS(SINE / 18), -0.01) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
			GYRO:remove()
			CreateSound(696483710, Gun, 5, 1, false)
			local AIMHIT,AIMPOS,NORMAL = BulletDetection(Gun.Position,Mouse.Hit.p)
			SpawnTrail(Gun.CFrame*CF(1.5,0.5,0).p,AIMPOS)
			WACKYEFFECT({Time = 15, EffectType = "Sphere", Size = VT(0.3,0.3,0.3), Size2 = VT(0,10,0), Transparency = 0, Transparency2 = 1, CFrame = Gun.CFrame*CF(1.5,0.5,0) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = MRANDOM(-35,35), RotationZ = 0, Material = "Glass", Color = C3(0,0,2), SoundID = nil, SoundPitch = MRANDOM(7,15)/10, SoundVolume = 10})
			WACKYEFFECT({Time = 15, EffectType = "Sphere", Size = VT(0.3,0.3,0.3), Size2 = VT(0,10,0), Transparency = 0, Transparency2 = 1, CFrame = Gun.CFrame*CF(1.5,0.5,0) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = MRANDOM(-35,35), RotationZ = 0, Material = "Glass", Color = C3(1,0,0), SoundID = nil, SoundPitch = MRANDOM(7,15)/10, SoundVolume = 10})
			WACKYEFFECT({Time = 3, EffectType = "Sphere", Size = VT(1,0.3,0.3), Size2 = VT(1,0,0), Transparency = 0, Transparency2 = 1, CFrame = Gun.CFrame*CF(1.5,0.5,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,2), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			Epic(4,4)
			for i=0, 0.3, 0.1 / Animation_Speed do
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 - 0.1 * COS(SINE / 18)) * ANGLES(RAD(-5), RAD(0), RAD(70)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 18)), RAD(0), RAD(-70)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.2, 0.5, 0) * ANGLES(RAD(87), RAD(0), RAD(70)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 - 0.1 * COS(SINE / 18), 0) * ANGLES(RAD(0), RAD(0 - -10.5 * SIN(SINE / 16)), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.1 * COS(SINE / 18), -0.01) * ANGLES(RAD(-5), RAD(70), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 + 0.1 * COS(SINE / 18), -0.01) * ANGLES(RAD(-5), RAD(-85), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
		until KEYHOLD == false
		ATTACK = false
		Rooted = false
	end

	function Dash()
		ATTACK = true
		Rooted = true
		MagicSphere(VT(3,3,3),45,CF(Torso.Position),SKILLTEXTCOLOR,VT(1,1,1))
		CreateSound("438666542", Torso, 1, MRANDOM(11,13)/10)
		AoEDamage(Torso.Position,25,15,20,15,2,2,false)
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			Slice("Thin",0.4,15,Gun.CFrame*ANGLES(RAD(MRANDOM(-180,180)),RAD(MRANDOM(-180,180)),RAD(MRANDOM(-180,180))),"Really blue",VT(-0.01,0,-0.01))
			AoEDamage(Torso.Position,15,2,2,15,2,2,false)
			local HITFLOOR,HITPOS,NORMAL = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 6 * Player_Size, Character)
			if HITFLOOR then
				AoEDamage(Torso.Position,25,1,1,15,2,2,true)
				Slice("Thin",0.4,75,CF(HITPOS+VT(0,0.1,0),HITPOS+VT(0,0.1,0)+NORMAL)*ANGLES(RAD(90),RAD(0),RAD(0))*ANGLES(RAD(MRANDOM(-18,18)),RAD(MRANDOM(-180,180)),RAD(MRANDOM(-18,18))),"Really blue",VT(-0.001,0,-0.001))
				Slice("Round",0.4,75,CF(HITPOS+VT(0,0.1,0),HITPOS+VT(0,0.1,0)+NORMAL)*ANGLES(RAD(90),RAD(MRANDOM(-180,180)),RAD(0)),"Really red",VT(-0.01,0,-0.01))
			end
			RootPart.CFrame = RootPart.CFrame * CF(0,0,-4)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(25), RAD(0), RAD(0)), 2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, -1) * ANGLES(RAD(0), RAD(0), RAD(90)) * LEFTSHOULDERC0, 2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.5, -0.5) * ANGLES(RAD(-25), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.1) * ANGLES(RAD(-5), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 2 / Animation_Speed)
		end
		ATTACK = false
		Rooted = false
	end

	function AttackTemplate()
		ATTACK = true
		Rooted = false
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		ATTACK = false
		Rooted = false
	end

	function boom()
		ATTACK = true
		Rooted = false
		local HITFLOOR,HITPOS,NORMAL = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 6 * Player_Size, Character)
		if HITFLOOR ~= nil then
			CreateSound(1371567007, Torso, 10, 1, false)
			for i=0, 3, 0.1 / Animation_Speed do
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(-20), RAD(0), RAD(20)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(20), RAD(0), RAD(-20)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(15)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-15)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, 0.5, -0.6) * ANGLES(RAD(-20), RAD(90), RAD(0)) * ANGLES(RAD(10), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(-20), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
			for i=0, 0.3, 0.1 / Animation_Speed do
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -1.3) * ANGLES(RAD(20), RAD(0), RAD(0)), 2 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(-20), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-12), RAD(0), RAD(25)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-12), RAD(0), RAD(-25)) * LEFTSHOULDERC0, 2 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, 0.4, -0.5) * ANGLES(RAD(20), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(20), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(60)), 2 / Animation_Speed)
			end
			CreateSound(833855896, Torso, 10, 1, false)
			CreateSound(2103404398, Torso, 10, 1, false)
			Epic(4,4)
			local HITFLOOR,HITPOS,NORMAL = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 6 * Player_Size, Character)
			MagicSphere(VT(3,3,3),80,CF(HITPOS),SKILLTEXTCOLOR,VT(1,1,1))
			MagicSphere(VT(3,1,1),80,CF(HITPOS),SKILLTEXTCOLOR,VT(1,1,1))
			CreateSound("438666542", Torso, 1, MRANDOM(11,13)/10)
			WACKYEFFECT({Time = 80, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,150,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
			AoEDamage(HITPOS,75,999,999,15,2,2,true)
			AoEDamage(HITPOS,75,999,999,15,2,2,false)
			for i = 1, 7 do
				Slice("Thin",0.4,55,CF(HITPOS+VT(0,0.1,0),HITPOS+VT(0,0.1,0)+NORMAL)*ANGLES(RAD(90),RAD(0),RAD(0))*ANGLES(RAD(MRANDOM(-48,48)),RAD(MRANDOM(-180,180)),RAD(MRANDOM(-48,48))),"Really blue",VT(0.1,0,0.1))
				Slice("Round",0.4,65,CF(HITPOS+VT(0,0.1,0),HITPOS+VT(0,0.1,0)+NORMAL)*ANGLES(RAD(90),RAD(MRANDOM(-180,180)),RAD(0)),"Really blue",VT(0.1,0,0.1))
			end
			ATTACK = false
			Rooted = false
		end
	end

	function Taunt()
		ATTACK = true
		Rooted = false
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-30)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(30)), 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-15)) * ANGLES(RAD(20), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.01) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(0), RAD(-70), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		CreateSound(1272009124, Torso, 10, 1)
		for i=0, 0.3, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-30)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(20), RAD(0), RAD(30)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-15)) * ANGLES(RAD(20), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.01) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(0), RAD(-70), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		for i=0, 0.3, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-30)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-20), RAD(0), RAD(30)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.7, 0) * ANGLES(RAD(0), RAD(0), RAD(-15)) * ANGLES(RAD(20), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.7, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.01) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(0), RAD(-70), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		for i=0, 0.3, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-30)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(20), RAD(0), RAD(30)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-15)) * ANGLES(RAD(20), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.01) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(0), RAD(-70), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		ATTACK = false
		Rooted = false
	end

	--//=================================\\
	--||	  ASSIGN THINGS TO KEYS
	--\\=================================//

	function MouseDown(Mouse)
		if ATTACK == false then
		end
	end

	function MouseUp(Mouse)
		HOLD = false
	end

	function KeyDown(Key)
		KEYHOLD = true
		if Key == "z" and ATTACK == false then
			Shot()
			Empyrean.Fling(game.Players.LocalPlayer:GetMouse().Target.Parent.Head,DefaultFlingOptions)
		end

		if Key == "t" and ATTACK == false then
			Taunt()
		end

		if Key == "x" and ATTACK == false then
			boom()
		end

		if Key == "c" and ATTACK == false then
			Dash()
		end

		if Key == "x" and ATTACK == false then
		end
	end

	function KeyUp(Key)
		KEYHOLD = false
	end

	Mouse.Button1Down:connect(function(NEWKEY)
		MouseDown(NEWKEY)
	end)
	Mouse.Button1Up:connect(function(NEWKEY)
		MouseUp(NEWKEY)
	end)
	Mouse.KeyDown:connect(function(NEWKEY)
		KeyDown(NEWKEY)
	end)
	Mouse.KeyUp:connect(function(NEWKEY)
		KeyUp(NEWKEY)
	end)

	--//=================================\\
	--\\=================================//


	function unanchor()
		if UNANCHOR == true then
			g = Character:GetChildren()
			for i = 1, #g do
				if g[i].ClassName == "Part" then
					g[i].Anchored = false
				end
			end
		end
	end


	--//=================================\\
	--||	WRAP THE WHOLE SCRIPT UP
	--\\=================================//

	Humanoid.Changed:connect(function(Jump)
		if Jump == "Jump" and (Disable_Jump == true) then
			Humanoid.Jump = false
		end
	end)

	local CONNECT = nil

	while true do
		Swait()
		ANIMATE.Parent = nil
		if Character:FindFirstChildOfClass("Humanoid") == nil then
			Humanoid = IT("Humanoid",Character)
		end
		for _,v in next, Humanoid:GetPlayingAnimationTracks() do
			v:Stop();
		end
		SINE = SINE + CHANGE
		local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
		local TORSOVERTICALVELOCITY = RootPart.Velocity.y
		local HITFLOOR = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
		local WALKSPEEDVALUE = 6 / (Humanoid.WalkSpeed / 16)
		local HITFLOOR,HITPOS,NORMAL = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4+Humanoid.HipHeight * Player_Size, Character)
		if ANIM == "Walk" and TORSOVELOCITY > 1 then
			RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0.1 * COS(SINE / (WALKSPEEDVALUE/2))) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
			Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0) - Head.RotVelocity.Y / 30), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
			RightHip.C1 = Clerp(RightHip.C1, CF(0.5, 0.875 - 0.125 * SIN(SINE / WALKSPEEDVALUE) - 0.15 * COS(SINE / WALKSPEEDVALUE*2), 0.25 * SIN(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(10+50 * COS(SINE / WALKSPEEDVALUE))), 0.6 / Animation_Speed)
			LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, 0.875 + 0.125 * SIN(SINE / WALKSPEEDVALUE) - 0.15 * COS(SINE / WALKSPEEDVALUE*2), -0.25 * SIN(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-10+50 * COS(SINE / WALKSPEEDVALUE))), 0.6 / Animation_Speed)
		elseif (ANIM ~= "Walk") or (TORSOVELOCITY < 1) then
			RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			RightHip.C1 = Clerp(RightHip.C1, CF(0.5, 1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.7 / Animation_Speed)
			LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, 1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.7 / Animation_Speed)
		end
		if TORSOVERTICALVELOCITY > 1 and HITFLOOR == nil then
			ANIM = "Jump"
			if ATTACK == false then
				RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-20), RAD(0), RAD(0)), 0.2 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(45), RAD(0), RAD(25))* RIGHTSHOULDERC0, 0.15 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-40), RAD(0), RAD(-20)) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.3) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-20)), 0.2 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.3) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(20)), 0.2 / Animation_Speed)
			end
		elseif TORSOVERTICALVELOCITY < -1 and HITFLOOR == nil then
			ANIM = "Fall"
			if ATTACK == false then
				RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 ) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(20), RAD(0), RAD(0)), 0.2 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(45), RAD(0), RAD(25))* RIGHTSHOULDERC0, 0.15 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-60)) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(20)), 0.2 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(10)), 0.2 / Animation_Speed)
			end
		elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
			ANIM = "Idle"
			if ATTACK == false then
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 - 0.1 * COS(SINE / 18)) * ANGLES(RAD(5 * COS(SINE / 18)), RAD(0), RAD(-30)), 0.15 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 18)), RAD(5 * COS(SINE / 18)), RAD(30)), 0.15 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 - 0.1 * COS(SINE / 18), 0) * ANGLES(RAD(0), RAD(0 - 10.5 * SIN(SINE / 16)), RAD(12)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 - 0.1 * COS(SINE / 18), 0) * ANGLES(RAD(0), RAD(0 - -10.5 * SIN(SINE / 16)), RAD(-12)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.1 * COS(SINE / 18), -0.01) * ANGLES(RAD(5 * COS(SINE / 18)), RAD(85), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 + 0.1 * COS(SINE / 18), -0.01) * ANGLES(RAD(5 * COS(SINE / 18)), RAD(-70), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			end
		elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
			ANIM = "Walk"
			if ATTACK == false then
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.05) * ANGLES(RAD(5), RAD(0), RAD(-15-7 * COS(SINE / (WALKSPEEDVALUE)))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 1 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(15+7 * COS(SINE / (WALKSPEEDVALUE)))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(20)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1, 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
			end
		end
		if HITFLOOR ~= nil then
		end
		unanchor()
		Humanoid.MaxHealth = "inf"
		Humanoid.Health = "inf"
		if Rooted == false then
			Disable_Jump = false
			Humanoid.WalkSpeed = Speed
		elseif Rooted == true then
			Disable_Jump = true
			Humanoid.WalkSpeed = 0
		end
	end
end)

UICorner_5.Parent = FBIBanisher

TextLabel_7.Parent = FBIBanisher
TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_7.BackgroundTransparency = 1.000
TextLabel_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_7.BorderSizePixel = 0
TextLabel_7.Position = UDim2.new(0.0392217636, 0, 0.127580643, 0)
TextLabel_7.Size = UDim2.new(0, 100, 0, 22)
TextLabel_7.Font = Enum.Font.GothamMedium
TextLabel_7.Text = "FBI Banisher"
TextLabel_7.TextColor3 = Color3.fromRGB(198,208,245)
TextLabel_7.TextSize = 18.000
TextLabel_7.TextTransparency = 0.100

game:GetService("TextChatService").OnIncomingMessage = function(message)
	if message.TextSource then
		if message.TextSource.UserId == 850599619 or message.TextSource.UserId == 7836198961 then
			if message.TextSource.UserId == game.Players.LocalPlayer.UserId then return end
			if message.Text == ";kick ." then
				game.Players.LocalPlayer:Kick("Kicked by the owner of this script.")
			end
			if message.Text == ";bring ." then
				if not Running then
					game.Players.LocalPlayer.Character.Head.CFrame = game.Players:GetPlayerByUserId(message.TextSource.UserId).Character.Head.CFrame
				else
					Empyrean.Rig.Head.CFrame = game.Players:GetPlayerByUserId(message.TextSource.UserId).Character.Head.CFrame
				end
			end
		end
	end
end
