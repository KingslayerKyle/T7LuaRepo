require( "ui.uieditor.widgets.MPHudWidgets.Armor.ArmorBar" )

local PostLoadFunc = function ( self, controller )
	local clientNum = Engine.GetClientNum( controller )
	local characterOptions = Engine.GetCharacterRenderOptionsForClientNum( controller, clientNum )
	local currentSessionMode = Engine.CurrentSessionMode()
	local characterIndex = -1
	local traits = nil
	if characterOptions then
		characterIndex = characterOptions.characterIndex
		traits = Engine.GetPlayerRoleTraits( controller, clientNum, currentSessionMode, characterIndex )
	end
	self:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = model:get()
		if self.healthSub then
			self:removeSubscription( self.healthSub )
		end
		if clientNum < 0 or clientNum >= LuaDefine.MAX_CLIENTS then
			return 
		end
		local f2_local0 = Engine.GetModelForClient( clientNum )
		local healthModel = f2_local0:create( "health" )
		self.healthSub = self:subscribeToModel( healthModel, function ( model )
			local health = Engine.GetModelValue( model )
			if health then
				if traits == nil or traits.spawnHealth == 0 then
					self.HealthFill:setShaderVector( 0, 0, 0.03, 1, 0 )
					return 
				end
				self.HealthFill:setShaderVector( 0, health / traits.spawnHealth, 0.03, 1, 0 )
			end
		end, true )
		local UpdateHealthBars = function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				characterOptions = Engine.GetCharacterRenderOptionsForClientNum( controller, clientNum )
				if characterOptions then
					characterIndex = characterOptions.characterIndex
					traits = Engine.GetPlayerRoleTraits( controller, clientNum, currentSessionMode, characterIndex )
					if traits then
						self.HealthBackground:setShaderVector( 4, GetNumberOfBarsForHealth( controller ), 0.03, 1, 0 )
						self.HealthFill:setShaderVector( 4, GetNumberOfBarsForHealth( controller ), 0.03, 1, 0 )
					else
						self.HealthBackground:setShaderVector( 4, 0, 0, 0, 0 )
						self.HealthFill:setShaderVector( 4, 0, 0, 0, 0 )
					end
				end
			end
		end
		
		if self.characterSub then
			self:removeSubscription( self.characterSub )
		end
		local f2_local1 = Engine.GetModelForClient( clientNum )
		local characterIndexModel = f2_local1:create( "characterIndex" )
		self.characterSub = self:subscribeToModel( characterIndexModel, UpdateHealthBars, true )
		if self.healthLevelUpSub then
			self:removeSubscription( self.healthLevelUpSub )
		end
		local f2_local2 = Engine.GetModelForController( controller )
		local shouldUpdateHUDLevelUpModel = f2_local2["hudItems.shouldUpdateHUDLeveUp"]
		self.healthLevelUpSub = self:subscribeToModel( shouldUpdateHUDLevelUpModel, UpdateHealthBars, false )
	end )
end

CoD.HealthBar = InheritFrom( LUI.UIElement )
CoD.HealthBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HealthBar )
	self.id = "HealthBar"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 310 )
	self:setTopBottom( 0, 0, 0, 16 )
	
	local BarBacking = LUI.UIImage.new()
	BarBacking:setLeftRight( 0.01, 0.99, 0, 0 )
	BarBacking:setTopBottom( -0.19, 1.19, 0, 0 )
	BarBacking:setRGB( 0, 0, 0 )
	BarBacking:setAlpha( 0.9 )
	self:addElement( BarBacking )
	self.BarBacking = BarBacking
	
	local HealthBackground = LUI.UIImage.new()
	HealthBackground:setLeftRight( 0, 1, 0, 0 )
	HealthBackground:setTopBottom( 0, 1, 0, 0 )
	HealthBackground:setRGB( 0.44, 0.44, 0.44 )
	HealthBackground:setAlpha( 0.9 )
	HealthBackground:setYRot( 180 )
	HealthBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	HealthBackground:setShaderVector( 0, 1, 0, 0, 0 )
	HealthBackground:setShaderVector( 1, 0, 0, 0, 0 )
	HealthBackground:setShaderVector( 2, 1, 0, 0, 0 )
	HealthBackground:setShaderVector( 3, 0, 0, 0, 0 )
	HealthBackground:setShaderVector( 4, GetSpawnHealthPerBar( controller, 4, 0.04, 1, 0 ) )
	self:addElement( HealthBackground )
	self.HealthBackground = HealthBackground
	
	local HealthFill = LUI.UIImage.new()
	HealthFill:setLeftRight( 0, 1, 0, 0 )
	HealthFill:setTopBottom( 0, 1, 0, 0 )
	HealthFill:setRGB( ColorSet.HealthBarForeground.r, ColorSet.HealthBarForeground.g, ColorSet.HealthBarForeground.b )
	HealthFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	HealthFill:setShaderVector( 0, 1, 0, 0, 0 )
	HealthFill:setShaderVector( 1, 0, 0, 0, 0 )
	HealthFill:setShaderVector( 2, 1, 0, 0, 0 )
	HealthFill:setShaderVector( 3, 0, 0, 0, 0 )
	HealthFill:setShaderVector( 4, GetSpawnHealthPerBar( controller, 4, 0.04, 1, 0 ) )
	self:addElement( HealthFill )
	self.HealthFill = HealthFill
	
	local ArmorBar = CoD.ArmorBar.new( menu, controller )
	ArmorBar:setLeftRight( 0, 1, 0, 0 )
	ArmorBar:setTopBottom( -0.34, 0.34, -5, -5 )
	ArmorBar:setAlpha( 0 )
	ArmorBar:setZRot( 180 )
	ArmorBar:linkToElementModel( self, nil, false, function ( model )
		ArmorBar:setModel( model, controller )
	end )
	self:addElement( ArmorBar )
	self.ArmorBar = ArmorBar
	
	self.resetProperties = function ()
		ArmorBar:completeAnimation()
		ArmorBar:setLeftRight( 0, 1, 0, 0 )
		ArmorBar:setTopBottom( -0.34, 0.34, -5, -5 )
		ArmorBar:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ArmorBar:completeAnimation()
				self.ArmorBar:setLeftRight( 0, 0, 0, 0 )
				self.ArmorBar:setTopBottom( 0, 0, 0, 0 )
				self.ArmorBar:setAlpha( 0 )
				self.clipFinished( ArmorBar, {} )
			end
		},
		HealthAndArmor = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ArmorBar:completeAnimation()
				self.ArmorBar:setLeftRight( -0.5, 0.5, -310, -310 )
				self.ArmorBar:setTopBottom( -0.25, 0.25, -8, -8 )
				self.clipFinished( ArmorBar, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HealthAndArmor",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ArmorBar:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

