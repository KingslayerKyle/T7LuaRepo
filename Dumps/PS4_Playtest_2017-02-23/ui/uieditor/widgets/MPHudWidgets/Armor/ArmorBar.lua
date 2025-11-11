local PostLoadFunc = function ( self, controller )
	local clientNum = Engine.GetClientNum( controller )
	local currentSessionMode = Engine.CurrentSessionMode()
	local traits = nil
	local getUpdatedPlayerRoleTraits = function ( controller, clientNum, currentSessionMode )
		local traits = nil
		local characterOptions = Engine.GetCharacterRenderOptionsForClientNum( controller, clientNum )
		if characterOptions then
			local characterIndex = characterOptions.characterIndex
			traits = Engine.GetPlayerRoleTraits( controller, clientNum, currentSessionMode, characterIndex )
		end
		return traits
	end
	
	self:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = model:get()
		if self.armorMaxSub then
			self:removeSubscription( self.armorMaxSub )
		end
		if clientNum < 0 or clientNum >= LuaDefine.MAX_CLIENTS then
			return 
		end
		local f3_local0 = Engine.GetModelForClient( clientNum )
		local armorMaxModel = f3_local0:create( "armorMax" )
		self.armorMaxSub = self:subscribeToModel( armorMaxModel, function ( model )
			local armorMax = Engine.GetModelValue( model )
			if armorMax then
				if traits and traits.armorBarMaxCount > 0 then
					local barsAvailable = armorMax / traits.armorPerBar
					local fillAmount = barsAvailable / traits.armorBarMaxCount
					self.ArmorBackground:setShaderVector( 0, fillAmount, 0, 1, 0 )
				else
					self.ArmorBackground:setShaderVector( 0, 0, 0, 0, 0 )
					self.ArmorFill:setShaderVector( 0, 0, 0, 0, 0 )
				end
			end
		end, true )
		if self.armorPctSub then
			self:removeSubscription( self.armorPctSub )
		end
		local f3_local1 = Engine.GetModelForClient( clientNum )
		f3_local1 = f3_local1:create( "armorPercent" )
		self.armorPctSub = self:subscribeToModel( f3_local1, function ( model )
			local armorPercent = Engine.GetModelValue( model )
			if armorPercent and traits and traits.armorBarMaxCount > 0 and traits.armorBarCount > 0 then
				if traits.armorBarCount == traits.armorBarMaxCount then
					self.ArmorFill:setShaderVector( 0, armorPercent, 0, 1, 0 )
					return 
				end
				local maxPercentage = traits.armorBarCount / traits.armorBarMaxCount
				local adjustedPercentage = maxPercentage * armorPercent
				self.ArmorFill:setShaderVector( 0, adjustedPercentage, 0, 1, 0 )
			end
		end, true )
		if self.armorTierSub then
			self:removeSubscription( self.armorTierSub )
		end
		local f3_local2 = Engine.GetModelForClient( clientNum )
		local armorTierModel = f3_local2:create( "armorTier" )
		self.armorTierSub = self:subscribeToModel( armorTierModel, function ( model )
			traits = getUpdatedPlayerRoleTraits( controller, clientNum, currentSessionMode )
			Engine.ForceNotifyModelSubscriptions( f3_local1 )
		end, true )
		if self.characterSub then
			self:removeSubscription( self.characterSub )
		end
		local f3_local3 = Engine.GetModelForClient( clientNum )
		local characterIndexModel = f3_local3:create( "characterIndex" )
		self.characterSub = self:subscribeToModel( characterIndexModel, function ( model )
			local characterIndex = Engine.GetModelValue( model )
			if characterIndex then
				traits = Engine.GetPlayerRoleTraits( controller, clientNum, currentSessionMode, characterIndex )
				if traits then
					self.ArmorBackground:setShaderVector( 4, traits.armorBarMaxCount, 0.01, 1, 0 )
					self.ArmorFill:setShaderVector( 4, traits.armorBarMaxCount, 0.01, 1, 0 )
				else
					self.ArmorBackground:setShaderVector( 4, 0, 0, 0, 0 )
					self.ArmorFill:setShaderVector( 4, 0, 0, 0, 0 )
				end
			end
		end, true )
	end )
end

CoD.ArmorBar = InheritFrom( LUI.UIElement )
CoD.ArmorBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ArmorBar )
	self.id = "ArmorBar"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 193 )
	self:setTopBottom( 0, 0, 0, 7 )
	
	local ArmorBackground = LUI.UIImage.new()
	ArmorBackground:setLeftRight( 0, 1, 0, 0 )
	ArmorBackground:setTopBottom( 0, 1, 0, 0 )
	ArmorBackground:setRGB( ColorSet.ArmorBarFillBackground.r, ColorSet.ArmorBarFillBackground.g, ColorSet.ArmorBarFillBackground.b )
	ArmorBackground:setAlpha( 0.5 )
	ArmorBackground:setZRot( -180 )
	ArmorBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	ArmorBackground:setShaderVector( 0, 1, 0, 0, 0 )
	ArmorBackground:setShaderVector( 1, 0, 0, 0, 0 )
	ArmorBackground:setShaderVector( 2, 1, 0, 0, 0 )
	ArmorBackground:setShaderVector( 3, 0, 0, 0, 0 )
	ArmorBackground:setShaderVector( 4, 5, 0.01, 1, 0 )
	self:addElement( ArmorBackground )
	self.ArmorBackground = ArmorBackground
	
	local ArmorFill = LUI.UIImage.new()
	ArmorFill:setLeftRight( 0, 1, 0, 0 )
	ArmorFill:setTopBottom( 0, 1, 0, 0 )
	ArmorFill:setRGB( ColorSet.ArmorBarFill.r, ColorSet.ArmorBarFill.g, ColorSet.ArmorBarFill.b )
	ArmorFill:setZRot( -180 )
	ArmorFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	ArmorFill:setShaderVector( 0, 1, 0, 0, 0 )
	ArmorFill:setShaderVector( 1, 0, 0, 0, 0 )
	ArmorFill:setShaderVector( 2, 1, 0, 0, 0 )
	ArmorFill:setShaderVector( 3, 0, 0, 0, 0 )
	ArmorFill:setShaderVector( 4, 5, 0.01, 1, 0 )
	self:addElement( ArmorFill )
	self.ArmorFill = ArmorFill
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

