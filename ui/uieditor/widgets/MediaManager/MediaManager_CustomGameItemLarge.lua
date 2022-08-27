-- ae88655273d08453958dca3e0c6f80cf
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.MediaManager_CustomGameItemLarge = InheritFrom( LUI.UIElement )
CoD.MediaManager_CustomGameItemLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MediaManager_CustomGameItemLarge )
	self.id = "MediaManager_CustomGameItemLarge"
	self.soundSet = "Paintshop"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 260 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 350 )
	BG:setTopBottom( true, false, 0, 290 )
	BG:setRGB( 0.4, 0.4, 0.4 )
	BG:setAlpha( 0 )
	self:addElement( BG )
	self.BG = BG
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgIdle:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local GameTypeImage = LUI.UIImage.new()
	GameTypeImage:setLeftRight( true, true, 78.25, -75.75 )
	GameTypeImage:setTopBottom( true, false, 13.5, 188.5 )
	GameTypeImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			GameTypeImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( GameTypeImage )
	self.GameTypeImage = GameTypeImage
	
	local NameBg = LUI.UIImage.new()
	NameBg:setLeftRight( true, false, 0, 350 )
	NameBg:setTopBottom( true, false, 200, 232 )
	NameBg:setAlpha( 0.8 )
	self:addElement( NameBg )
	self.NameBg = NameBg
	
	local Name = LUI.UITightText.new()
	Name:setLeftRight( true, false, 2.5, 350 )
	Name:setTopBottom( true, false, 202, 232 )
	Name:setRGB( 0, 0, 0 )
	Name:setTTF( "fonts/default.ttf" )
	Name:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			Name:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local GameTypeName = LUI.UITightText.new()
	GameTypeName:setLeftRight( true, false, 2.5, 350 )
	GameTypeName:setTopBottom( true, false, 235, 260 )
	GameTypeName:setTTF( "fonts/default.ttf" )
	GameTypeName:linkToElementModel( self, "gameTypeString", true, function ( model )
		local gameTypeString = Engine.GetModelValue( model )
		if gameTypeString then
			GameTypeName:setText( Engine.Localize( gameTypeString ) )
		end
	end )
	self:addElement( GameTypeName )
	self.GameTypeName = GameTypeName
	
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
				GameTypeImage:completeAnimation()
				self.GameTypeImage:setAlpha( 1 )
				self.clipFinished( GameTypeImage, {} )
				NameBg:completeAnimation()
				self.NameBg:setAlpha( 0.8 )
				self.clipFinished( NameBg, {} )
				Name:completeAnimation()
				self.Name:setAlpha( 1 )
				self.clipFinished( Name, {} )
				GameTypeName:completeAnimation()
				self.GameTypeName:setAlpha( 1 )
				self.clipFinished( GameTypeName, {} )
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
				GameTypeImage:completeAnimation()
				self.GameTypeImage:setAlpha( 0 )
				self.clipFinished( GameTypeImage, {} )
				NameBg:completeAnimation()
				self.NameBg:setAlpha( 0 )
				self.clipFinished( NameBg, {} )
				Name:completeAnimation()
				self.Name:setAlpha( 0 )
				self.clipFinished( Name, {} )
				GameTypeName:completeAnimation()
				self.GameTypeName:setAlpha( 0 )
				self.clipFinished( GameTypeName, {} )
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
		element.GameTypeImage:close()
		element.Name:close()
		element.GameTypeName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

