require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.MediaManager_TheaterFileItemLarge = InheritFrom( LUI.UIElement )
CoD.MediaManager_TheaterFileItemLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MediaManager_TheaterFileItemLarge )
	self.id = "MediaManager_TheaterFileItemLarge"
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
	
	local Thumbnail = LUI.UIElement.new()
	Thumbnail:setLeftRight( true, true, 1.25, -1.25 )
	Thumbnail:setTopBottom( true, false, 2, 200 )
	Thumbnail:linkToElementModel( self, "fileId", true, function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			Thumbnail:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", fileId ) )
		end
	end )
	self:addElement( Thumbnail )
	self.Thumbnail = Thumbnail
	
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
	Name:linkToElementModel( self, "fileName", true, function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			Name:setText( Engine.Localize( fileName ) )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local Description = LUI.UITightText.new()
	Description:setLeftRight( true, false, 2.5, 350 )
	Description:setTopBottom( true, false, 235, 260 )
	Description:setTTF( "fonts/default.ttf" )
	Description:linkToElementModel( self, "fileDescription", true, function ( model )
		local fileDescription = Engine.GetModelValue( model )
		if fileDescription then
			Description:setText( Engine.Localize( fileDescription ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
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
				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 1 )
				self.clipFinished( Thumbnail, {} )
				NameBg:completeAnimation()
				self.NameBg:setAlpha( 0.8 )
				self.clipFinished( NameBg, {} )
				Name:completeAnimation()
				self.Name:setAlpha( 1 )
				self.clipFinished( Name, {} )
				Description:completeAnimation()
				self.Description:setAlpha( 1 )
				self.clipFinished( Description, {} )
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
				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
				NameBg:completeAnimation()
				self.NameBg:setAlpha( 0 )
				self.clipFinished( NameBg, {} )
				Name:completeAnimation()
				self.Name:setAlpha( 0 )
				self.clipFinished( Name, {} )
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				self.clipFinished( Description, {} )
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
		element.Thumbnail:close()
		element.Name:close()
		element.Description:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

