require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PreLoadFunc = function ( self, controller )
	local selectedPaintjobRootModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManagerSelectedPaintjob" )
	local model = Engine.CreateModel( selectedPaintjobRootModel, "paintjobSlotAndIndex" )
end

CoD.MediaManager_PaintshopItemLarge = InheritFrom( LUI.UIElement )
CoD.MediaManager_PaintshopItemLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MediaManager_PaintshopItemLarge )
	self.id = "MediaManager_PaintshopItemLarge"
	self.soundSet = "Paintshop"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 525 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 525 )
	BG:setTopBottom( 0, 0, 0, 435 )
	BG:setRGB( 0.4, 0.4, 0.4 )
	BG:setAlpha( 0 )
	self:addElement( BG )
	self.BG = BG
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 0, -3, 528 )
	BoxButtonLrgIdle:setTopBottom( 0, 0, -3, 487 )
	BoxButtonLrgIdle:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local extraCamRender = LUI.UIImage.new()
	extraCamRender:setLeftRight( 0, 1, 0, 0 )
	extraCamRender:setTopBottom( 0, 1, 0, -42 )
	extraCamRender:subscribeToGlobalModel( controller, "MediaManagerSelectedPaintjob", "paintjobSlotAndIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			extraCamRender:setupWCPaintjobIconExtraCamRender( GetPaintshopExtraCamParameters( controller, modelValue ) )
		end
	end )
	self:addElement( extraCamRender )
	self.extraCamRender = extraCamRender
	
	local WeaponNameBg = LUI.UIImage.new()
	WeaponNameBg:setLeftRight( 0, 0, 0, 525 )
	WeaponNameBg:setTopBottom( 0, 0, 435, 483 )
	WeaponNameBg:setAlpha( 0.8 )
	self:addElement( WeaponNameBg )
	self.WeaponNameBg = WeaponNameBg
	
	local WeaponName = LUI.UITightText.new()
	WeaponName:setLeftRight( 0, 0, 4, 525 )
	WeaponName:setTopBottom( 0, 0, 487, 525 )
	WeaponName:setTTF( "fonts/default.ttf" )
	WeaponName:linkToElementModel( self, "weaponName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local PaintjobName = LUI.UITightText.new()
	PaintjobName:setLeftRight( 0, 0, 4, 525 )
	PaintjobName:setTopBottom( 0, 0, 438, 483 )
	PaintjobName:setRGB( 0, 0, 0 )
	PaintjobName:setTTF( "fonts/default.ttf" )
	PaintjobName:linkToElementModel( self, "paintjobName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PaintjobName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PaintjobName )
	self.PaintjobName = PaintjobName
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, -5, 3 )
	StartMenuframenoBG0:setTopBottom( 0, 1, -3, 3 )
	StartMenuframenoBG0:setAlpha( 0.85 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.resetProperties = function ()
		extraCamRender:completeAnimation()
		WeaponNameBg:completeAnimation()
		WeaponName:completeAnimation()
		PaintjobName:completeAnimation()
		StartMenuframenoBG0:completeAnimation()
		BoxButtonLrgIdle:completeAnimation()
		extraCamRender:setAlpha( 1 )
		WeaponNameBg:setAlpha( 0.8 )
		WeaponName:setAlpha( 1 )
		PaintjobName:setAlpha( 1 )
		StartMenuframenoBG0:setAlpha( 0.85 )
		BoxButtonLrgIdle:setAlpha( 0.4 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				extraCamRender:completeAnimation()
				self.extraCamRender:setAlpha( 0 )
				self.clipFinished( extraCamRender, {} )
				WeaponNameBg:completeAnimation()
				self.WeaponNameBg:setAlpha( 0 )
				self.clipFinished( WeaponNameBg, {} )
				WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( WeaponName, {} )
				PaintjobName:completeAnimation()
				self.PaintjobName:setAlpha( 0 )
				self.clipFinished( PaintjobName, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not MediaManagerSlotsUsed( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.slotsUsed" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.slotsUsed"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgIdle:close()
		self.StartMenuframenoBG0:close()
		self.extraCamRender:close()
		self.WeaponName:close()
		self.PaintjobName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

