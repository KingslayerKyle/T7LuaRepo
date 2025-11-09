require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManagerSelectedVariant" )
	local f1_local1 = Engine.CreateModel( f1_local0, "variantIndex" )
	local f1_local2 = Engine.CreateModel( f1_local0, "variantName" )
	local f1_local3 = Engine.CreateModel( f1_local0, "weaponName" )
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
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 350 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 350 )
	BG:setTopBottom( true, false, 0, 292 )
	BG:setRGB( 0.4, 0.4, 0.4 )
	BG:setAlpha( 0 )
	self:addElement( BG )
	self.BG = BG
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, false, -2, 352 )
	BoxButtonLrgIdle:setTopBottom( true, false, -2, 324.5 )
	BoxButtonLrgIdle:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local WCVariantIconExtraCamRender0 = LUI.UIImage.new()
	WCVariantIconExtraCamRender0:setLeftRight( true, false, 0, 350 )
	WCVariantIconExtraCamRender0:setTopBottom( true, false, 0, 322 )
	WCVariantIconExtraCamRender0:linkToElementModel( self, "variantIndex", true, function ( model )
		local variantIndex = Engine.GetModelValue( model )
		if variantIndex then
			WCVariantIconExtraCamRender0:setupWCVariantIconExtraCamRender( GetGunsmithExtraCamParameters( controller, variantIndex ) )
		end
	end )
	self:addElement( WCVariantIconExtraCamRender0 )
	self.WCVariantIconExtraCamRender0 = WCVariantIconExtraCamRender0
	
	local WeaponNameBg = LUI.UIImage.new()
	WeaponNameBg:setLeftRight( true, false, 0, 350 )
	WeaponNameBg:setTopBottom( true, false, 290, 322 )
	WeaponNameBg:setAlpha( 0.8 )
	self:addElement( WeaponNameBg )
	self.WeaponNameBg = WeaponNameBg
	
	local VariantName = LUI.UITightText.new()
	VariantName:setLeftRight( true, false, 2.5, 348.5 )
	VariantName:setTopBottom( true, false, 292, 322 )
	VariantName:setRGB( 0, 0, 0 )
	VariantName:setTTF( "fonts/default.ttf" )
	VariantName:linkToElementModel( self, "variantName", true, function ( model )
		local variantName = Engine.GetModelValue( model )
		if variantName then
			VariantName:setText( variantName )
		end
	end )
	self:addElement( VariantName )
	self.VariantName = VariantName
	
	local WeaponNameLabel = LUI.UITightText.new()
	WeaponNameLabel:setLeftRight( true, false, 2.5, 350 )
	WeaponNameLabel:setTopBottom( true, false, 325, 350 )
	WeaponNameLabel:setTTF( "fonts/default.ttf" )
	WeaponNameLabel:linkToElementModel( self, "weaponName", true, function ( model )
		local weaponName = Engine.GetModelValue( model )
		if weaponName then
			WeaponNameLabel:setText( Engine.Localize( weaponName ) )
		end
	end )
	self:addElement( WeaponNameLabel )
	self.WeaponNameLabel = WeaponNameLabel
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, -2.5, 2.5 )
	StartMenuframenoBG0:setTopBottom( true, true, -2, 2 )
	StartMenuframenoBG0:setAlpha( 0.85 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				WCVariantIconExtraCamRender0:completeAnimation()
				self.WCVariantIconExtraCamRender0:setAlpha( 1 )
				self.clipFinished( WCVariantIconExtraCamRender0, {} )
				WeaponNameBg:completeAnimation()
				self.WeaponNameBg:setAlpha( 0.8 )
				self.clipFinished( WeaponNameBg, {} )
				VariantName:completeAnimation()
				self.VariantName:setAlpha( 1 )
				self.clipFinished( VariantName, {} )
				WeaponNameLabel:completeAnimation()
				self.WeaponNameLabel:setAlpha( 1 )
				self.clipFinished( WeaponNameLabel, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0.85 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgIdle:close()
		element.StartMenuframenoBG0:close()
		element.WCVariantIconExtraCamRender0:close()
		element.VariantName:close()
		element.WeaponNameLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

