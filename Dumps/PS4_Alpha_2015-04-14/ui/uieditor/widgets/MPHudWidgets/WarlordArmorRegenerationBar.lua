require( "ui.uieditor.widgets.MPHudWidgets.WarlordRegenBarFillStencil" )

local WarlordArmorRegenerationBar_Table = {}
local WarlordArmorRegenerationBar_LowThreshold = 0.26
local WarlordArmorRegenerationBar_SetupEntityContainer = function ( self, controller, entityNum )
	if entityNum then
		self:setLeftRight( false, false, 0, 175 )
		self:setTopBottom( false, false, -80, 0 )
		local entityOffset = {
			0,
			0,
			75
		}
		self:setupEntityContainer( entityNum, unpack( entityOffset ) )
		self:setEntityContainerClamp( false )
		self:setEntityContainerScale( false )
		self:setEntityContainerScaleClamp( false )
		if self.setEntityContainerHideOutRange ~= nil then
			self:setEntityContainerHideOutRange( true )
		end
		self.entNum = entityNum
		table.insert( WarlordArmorRegenerationBar_Table, self )
		local perControllerModel = Engine.GetModelForController( controller )
		local interactivePromptModel = Engine.CreateModel( perControllerModel, "interactivePrompt" )
		local warlordRegenModel = Engine.CreateModel( interactivePromptModel, "warlordArmorRegeneration_" .. entityNum )
		Engine.SetModelValue( warlordRegenModel, "1.0" )
		self:subscribeToModel( warlordRegenModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				local width = self.maxWidth * tonumber( modelValue )
				self.WarlordRegenBarFillStencil:setLeftRight( true, true, self.startX, width - self.maxWidth )
			end
		end )
	end
end

local WarlordArmorRegenerationBar_RemoveEntityContainer = function ( self, entityNum )
	local indexToRemove = 0
	for i = 1, #WarlordArmorRegenerationBar_Table, 1 do
		if WarlordArmorRegenerationBar_Table[i].entNum == entityNum then
			indexToRemove = i
			break
		end
	end
	if 0 < indexToRemove then
		WarlordArmorRegenerationBar_Table[indexToRemove]:close()
		table.remove( WarlordArmorRegenerationBar_Table, indexToRemove )
	end
end

local WarlordArmorRegenerationBar_ValueChanged = function ( self, event )
	local perControllerModel = Engine.GetModelForController( event.controller )
	local interactivePromptModel = Engine.CreateModel( perControllerModel, "interactivePrompt" )
	local warlordRegenModel = Engine.CreateModel( interactivePromptModel, "warlordArmorRegeneration_" .. event.entNum )
	Engine.SetModelValue( warlordRegenModel, "" .. event.newValue )
	if self.entNum == event.entNum then
		if event.newValue <= WarlordArmorRegenerationBar_LowThreshold then
			self:setState( "LowEnergy" )
		else
			self:setState( "DefaultState" )
		end
	end
end

local WarlordArmorRegenerationBar_Close = function ( self )
	self:unsubscribeFromAllModels()
	LUI.UIElement.close( self )
end

local PostLoadFunc = function ( self )
	self.setupEntity = WarlordArmorRegenerationBar_SetupEntityContainer
	self.removeEntity = WarlordArmorRegenerationBar_RemoveEntityContainer
	self:registerEventHandler( "warlord_armor_regeneration_value", WarlordArmorRegenerationBar_ValueChanged )
	self.maxWidth = 100
	self.startX = 75
	self.close = WarlordArmorRegenerationBar_Close
end

CoD.WarlordArmorRegenerationBar = InheritFrom( LUI.UIElement )
CoD.WarlordArmorRegenerationBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WarlordArmorRegenerationBar )
	self.id = "WarlordArmorRegenerationBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 179 )
	self:setTopBottom( true, false, 0, 75 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 75, 175 )
	background:setTopBottom( false, true, -49, -31 )
	background:setRGB( 1, 1, 1 )
	background:setAlpha( 0.2 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local WarlordRegenBarFillStencil = CoD.WarlordRegenBarFillStencil.new( menu, controller )
	WarlordRegenBarFillStencil:setLeftRight( true, false, 75, 175 )
	WarlordRegenBarFillStencil:setTopBottom( false, true, -49, -31 )
	WarlordRegenBarFillStencil:setRGB( 1, 1, 1 )
	self:addElement( WarlordRegenBarFillStencil )
	self.WarlordRegenBarFillStencil = WarlordRegenBarFillStencil
	
	local RepairingArmorText = LUI.UIText.new()
	RepairingArmorText:setLeftRight( false, true, -178.38, 0 )
	RepairingArmorText:setTopBottom( false, false, -33.5, -13.5 )
	RepairingArmorText:setRGB( 1, 1, 1 )
	RepairingArmorText:setText( Engine.Localize( "SM_REPAIRING_ARMOR" ) )
	RepairingArmorText:setTTF( "fonts/default.ttf" )
	RepairingArmorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	RepairingArmorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RepairingArmorText )
	self.RepairingArmorText = RepairingArmorText
	
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
				WarlordRegenBarFillStencil:completeAnimation()
				self.WarlordRegenBarFillStencil:setRGB( 1, 1, 1 )
				self.clipFinished( WarlordRegenBarFillStencil, {} )
			end
		},
		LowEnergy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setRGB( 1, 1, 1 )
				self.background:setAlpha( 0.2 )
				self.clipFinished( background, {} )
				WarlordRegenBarFillStencil:completeAnimation()
				self.WarlordRegenBarFillStencil:setRGB( 1, 0, 0 )
				self.clipFinished( WarlordRegenBarFillStencil, {} )
			end
		}
	}
	self.close = function ( self )
		self.WarlordRegenBarFillStencil:close()
		CoD.WarlordArmorRegenerationBar.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

