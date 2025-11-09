require( "ui.uieditor.widgets.MPHudWidgets.ResourceEnergyBarFill" )

local ResourceEnergyBar_Table = {}
local ResourceEnergyBar_LowThreshold = 0.26
local ResourceEnergyBar_SetupEntityContainer = function ( self, controller, entityNum )
	if entityNum then
		self:setLeftRight( false, false, 0, 175 )
		self:setTopBottom( false, false, -80, 0 )
		local entityOffset = {
			0,
			0,
			15
		}
		self:setupEntityContainer( entityNum, unpack( entityOffset ) )
		self:setEntityContainerClamp( false )
		self:setEntityContainerScale( false )
		self:setEntityContainerScaleClamp( false )
		if self.setEntityContainerHideOutRange ~= nil then
			self:setEntityContainerHideOutRange( true )
		end
		self.entNum = entityNum
		table.insert( ResourceEnergyBar_Table, self )
		local perControllerModel = Engine.GetModelForController( controller )
		local interactivePromptModel = Engine.CreateModel( perControllerModel, "interactivePrompt" )
		local resourceEnergyModel = Engine.CreateModel( interactivePromptModel, "resourceEnergy_" .. entityNum )
		Engine.SetModelValue( resourceEnergyModel, "1.0" )
		self:subscribeToModel( resourceEnergyModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				local width = self.maxWidth * tonumber( modelValue )
				self.ResourceEnergyBarFill:setLeftRight( true, true, self.startX, width - self.maxWidth )
			end
		end )
	end
end

local ResourceEnergyBar_RemoveEntityContainer = function ( self, entityNum )
	local indexToRemove = 0
	for i = 1, #ResourceEnergyBar_Table, 1 do
		if ResourceEnergyBar_Table[i].entNum == entityNum then
			indexToRemove = i
			break
		end
	end
	if 0 < indexToRemove then
		ResourceEnergyBar_Table[indexToRemove]:close()
		table.remove( ResourceEnergyBar_Table, indexToRemove )
	end
end

local ResourceEnergyBar_ValueChanged = function ( self, event )
	local perControllerModel = Engine.GetModelForController( event.controller )
	local interactivePromptModel = Engine.CreateModel( perControllerModel, "interactivePrompt" )
	local resourceEnergyModel = Engine.CreateModel( interactivePromptModel, "resourceEnergy_" .. event.entNum )
	Engine.SetModelValue( resourceEnergyModel, "" .. event.newValue )
	if self.entNum == event.entNum then
		if event.newValue <= ResourceEnergyBar_LowThreshold then
			self:setState( "LowEnergy" )
		else
			self:setState( "DefaultState" )
		end
	end
end

local ResourceEnergyBar_Close = function ( self )
	self:unsubscribeFromAllModels()
	LUI.UIElement.close( self )
end

local PostLoadFunc = function ( self )
	self.setupEntity = ResourceEnergyBar_SetupEntityContainer
	self.removeEntity = ResourceEnergyBar_RemoveEntityContainer
	self:registerEventHandler( "resource_energy_value", ResourceEnergyBar_ValueChanged )
	self.maxWidth = 100
	self.startX = 75
	self.close = ResourceEnergyBar_Close
end

CoD.ResourceEnergyBar = InheritFrom( LUI.UIElement )
CoD.ResourceEnergyBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ResourceEnergyBar )
	self.id = "ResourceEnergyBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 175 )
	self:setTopBottom( true, false, 0, 75 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 75, 175 )
	background:setTopBottom( false, true, -49, -31 )
	background:setRGB( 1, 1, 1 )
	background:setAlpha( 0.2 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local ResourceEnergyBarFill = CoD.ResourceEnergyBarFill.new( menu, controller )
	ResourceEnergyBarFill:setLeftRight( true, false, 75, 175 )
	ResourceEnergyBarFill:setTopBottom( false, true, -49, -31 )
	ResourceEnergyBarFill:setRGB( 1, 1, 1 )
	self:addElement( ResourceEnergyBarFill )
	self.ResourceEnergyBarFill = ResourceEnergyBarFill
	
	local EnergyText = LUI.UIText.new()
	EnergyText:setLeftRight( false, false, -12.5, 87.5 )
	EnergyText:setTopBottom( false, true, -71, -51 )
	EnergyText:setRGB( 1, 1, 1 )
	EnergyText:setText( Engine.Localize( "SM_ENERGY" ) )
	EnergyText:setTTF( "fonts/default.ttf" )
	EnergyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EnergyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EnergyText )
	self.EnergyText = EnergyText
	
	local horizontal = LUI.UIImage.new()
	horizontal:setLeftRight( false, false, -33.25, -12.5 )
	horizontal:setTopBottom( false, true, -40.75, -39.25 )
	horizontal:setRGB( 1, 1, 1 )
	horizontal:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( horizontal )
	self.horizontal = horizontal
	
	local diagonal = LUI.UIImage.new()
	diagonal:setLeftRight( false, false, -93.5, -26.5 )
	diagonal:setTopBottom( false, true, -21, -19.5 )
	diagonal:setRGB( 1, 1, 1 )
	diagonal:setZRot( 36 )
	diagonal:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( diagonal )
	self.diagonal = diagonal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setAlpha( 0.2 )
				self.clipFinished( background, {} )
				ResourceEnergyBarFill:completeAnimation()
				self.ResourceEnergyBarFill:setRGB( 1, 1, 1 )
				self.clipFinished( ResourceEnergyBarFill, {} )
			end
		},
		LowEnergy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setRGB( 1, 1, 1 )
				self.background:setAlpha( 0.2 )
				self.clipFinished( background, {} )
				ResourceEnergyBarFill:completeAnimation()
				self.ResourceEnergyBarFill:setRGB( 1, 0, 0 )
				self.clipFinished( ResourceEnergyBarFill, {} )
			end
		}
	}
	self.close = function ( self )
		self.ResourceEnergyBarFill:close()
		CoD.ResourceEnergyBar.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

