-- 683a12e74afda6b2d0d4e0969a67b850
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManagerSelectedPaintjob" ), "paintjobSlotAndIndex" )
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
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 350 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 350 )
	BG:setTopBottom( true, false, 0, 290 )
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
	
	local extraCamRender = LUI.UIImage.new()
	extraCamRender:setLeftRight( true, true, 0, 0 )
	extraCamRender:setTopBottom( true, true, 0, -28 )
	extraCamRender:subscribeToGlobalModel( controller, "MediaManagerSelectedPaintjob", "paintjobSlotAndIndex", function ( model )
		local paintjobSlotAndIndex = Engine.GetModelValue( model )
		if paintjobSlotAndIndex then
			extraCamRender:setupWCPaintjobIconExtraCamRender( GetPaintshopExtraCamParameters( controller, paintjobSlotAndIndex ) )
		end
	end )
	self:addElement( extraCamRender )
	self.extraCamRender = extraCamRender
	
	local WeaponNameBg = LUI.UIImage.new()
	WeaponNameBg:setLeftRight( true, false, 0, 350 )
	WeaponNameBg:setTopBottom( true, false, 290, 322 )
	WeaponNameBg:setAlpha( 0.8 )
	self:addElement( WeaponNameBg )
	self.WeaponNameBg = WeaponNameBg
	
	local WeaponName = LUI.UITightText.new()
	WeaponName:setLeftRight( true, false, 2.5, 350 )
	WeaponName:setTopBottom( true, false, 325, 350 )
	WeaponName:setTTF( "fonts/default.ttf" )
	WeaponName:linkToElementModel( self, "weaponName", true, function ( model )
		local weaponName = Engine.GetModelValue( model )
		if weaponName then
			WeaponName:setText( Engine.Localize( weaponName ) )
		end
	end )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local PaintjobName = LUI.UITightText.new()
	PaintjobName:setLeftRight( true, false, 2.5, 350 )
	PaintjobName:setTopBottom( true, false, 292, 322 )
	PaintjobName:setRGB( 0, 0, 0 )
	PaintjobName:setTTF( "fonts/default.ttf" )
	PaintjobName:linkToElementModel( self, "paintjobName", true, function ( model )
		local paintjobName = Engine.GetModelValue( model )
		if paintjobName then
			PaintjobName:setText( paintjobName )
		end
	end )
	self:addElement( PaintjobName )
	self.PaintjobName = PaintjobName
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, -3, 2 )
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

				extraCamRender:completeAnimation()
				self.extraCamRender:setAlpha( 1 )
				self.clipFinished( extraCamRender, {} )

				WeaponNameBg:completeAnimation()
				self.WeaponNameBg:setAlpha( 0.8 )
				self.clipFinished( WeaponNameBg, {} )

				WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 1 )
				self.clipFinished( WeaponName, {} )

				PaintjobName:completeAnimation()
				self.PaintjobName:setAlpha( 1 )
				self.clipFinished( PaintjobName, {} )

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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgIdle:close()
		element.StartMenuframenoBG0:close()
		element.extraCamRender:close()
		element.WeaponName:close()
		element.PaintjobName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
