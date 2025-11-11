require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PreLoadFunc = function ( self, controller )
	local selectedVariantRootModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManagerSelectedVariant" )
	local model = Engine.CreateModel( selectedVariantRootModel, "variantIndex" )
	local nameModel = Engine.CreateModel( selectedVariantRootModel, "variantName" )
	local weaponNameModel = Engine.CreateModel( selectedVariantRootModel, "weaponName" )
end

CoD.MediaManager_VariantItemLarge = InheritFrom( LUI.UIElement )
CoD.MediaManager_VariantItemLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MediaManager_VariantItemLarge )
	self.id = "MediaManager_VariantItemLarge"
	self.soundSet = "Paintshop"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 525 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 525 )
	BG:setTopBottom( 0, 0, 0, 438 )
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
	
	local WCVariantIconExtraCamRender0 = LUI.UIImage.new()
	WCVariantIconExtraCamRender0:setLeftRight( 0, 0, 0, 525 )
	WCVariantIconExtraCamRender0:setTopBottom( 0, 0, 0, 483 )
	WCVariantIconExtraCamRender0:linkToElementModel( self, "variantIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WCVariantIconExtraCamRender0:setupWCVariantIconExtraCamRender( GetGunsmithExtraCamParameters( controller, modelValue ) )
		end
	end )
	self:addElement( WCVariantIconExtraCamRender0 )
	self.WCVariantIconExtraCamRender0 = WCVariantIconExtraCamRender0
	
	local WeaponNameBg = LUI.UIImage.new()
	WeaponNameBg:setLeftRight( 0, 0, 0, 525 )
	WeaponNameBg:setTopBottom( 0, 0, 435, 483 )
	WeaponNameBg:setAlpha( 0.8 )
	self:addElement( WeaponNameBg )
	self.WeaponNameBg = WeaponNameBg
	
	local VariantName = LUI.UITightText.new()
	VariantName:setLeftRight( 0, 0, 4, 523 )
	VariantName:setTopBottom( 0, 0, 438, 483 )
	VariantName:setRGB( 0, 0, 0 )
	VariantName:setTTF( "fonts/default.ttf" )
	VariantName:linkToElementModel( self, "variantName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VariantName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( VariantName )
	self.VariantName = VariantName
	
	local WeaponNameLabel = LUI.UITightText.new()
	WeaponNameLabel:setLeftRight( 0, 0, 4, 525 )
	WeaponNameLabel:setTopBottom( 0, 0, 487, 525 )
	WeaponNameLabel:setTTF( "fonts/default.ttf" )
	WeaponNameLabel:linkToElementModel( self, "weaponName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( WeaponNameLabel )
	self.WeaponNameLabel = WeaponNameLabel
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, -4, 4 )
	StartMenuframenoBG0:setTopBottom( 0, 1, -3, 3 )
	StartMenuframenoBG0:setAlpha( 0.85 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.resetProperties = function ()
		WCVariantIconExtraCamRender0:completeAnimation()
		WeaponNameLabel:completeAnimation()
		VariantName:completeAnimation()
		WeaponNameBg:completeAnimation()
		StartMenuframenoBG0:completeAnimation()
		BoxButtonLrgIdle:completeAnimation()
		WCVariantIconExtraCamRender0:setAlpha( 1 )
		WeaponNameLabel:setAlpha( 1 )
		VariantName:setAlpha( 1 )
		WeaponNameBg:setAlpha( 0.8 )
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
				WCVariantIconExtraCamRender0:completeAnimation()
				self.WCVariantIconExtraCamRender0:setAlpha( 0 )
				self.clipFinished( WCVariantIconExtraCamRender0, {} )
				WeaponNameBg:completeAnimation()
				self.WeaponNameBg:setAlpha( 0 )
				self.clipFinished( WeaponNameBg, {} )
				VariantName:completeAnimation()
				self.VariantName:setAlpha( 0 )
				self.clipFinished( VariantName, {} )
				WeaponNameLabel:completeAnimation()
				self.WeaponNameLabel:setAlpha( 0 )
				self.clipFinished( WeaponNameLabel, {} )
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
		self.WCVariantIconExtraCamRender0:close()
		self.VariantName:close()
		self.WeaponNameLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

