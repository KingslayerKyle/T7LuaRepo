-- afba01b6828a71511d3a31a11120d928
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.FileShare.FileshareCustomGamesLocalGameTypeImage" )

CoD.MyShowcase_PublishedCustomGameInfo = InheritFrom( LUI.UIElement )
CoD.MyShowcase_PublishedCustomGameInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MyShowcase_PublishedCustomGameInfo )
	self.id = "MyShowcase_PublishedCustomGameInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 482 )
	self.anyChildUsesUpdateState = true
	
	local FileshareSelectedItemInfo = CoD.FileshareSelectedItemInfo.new( menu, controller )
	FileshareSelectedItemInfo:setLeftRight( true, false, 36.5, 463.5 )
	FileshareSelectedItemInfo:setTopBottom( true, false, 398, 482 )
	FileshareSelectedItemInfo:linkToElementModel( self, nil, false, function ( model )
		FileshareSelectedItemInfo:setModel( model, controller )
	end )
	self:addElement( FileshareSelectedItemInfo )
	self.FileshareSelectedItemInfo = FileshareSelectedItemInfo
	
	local FileName = CoD.WeaponNameWidget.new( menu, controller )
	FileName:setLeftRight( true, false, 38, 461 )
	FileName:setTopBottom( true, false, 285, 319 )
	FileName:linkToElementModel( self, nil, false, function ( model )
		FileName:setModel( model, controller )
	end )
	FileName:linkToElementModel( self, "fileName", true, function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			FileName.weaponNameLabel:setText( fileName )
		end
	end )
	self:addElement( FileName )
	self.FileName = FileName
	
	local GameTypeName = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	GameTypeName:setLeftRight( true, false, 35.5, 463.5 )
	GameTypeName:setTopBottom( true, false, 325.5, 351.5 )
	GameTypeName.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GameTypeName:linkToElementModel( self, "gameTypeString", true, function ( model )
		local gameTypeString = Engine.GetModelValue( model )
		if gameTypeString then
			GameTypeName.SubTitle:setText( Engine.Localize( gameTypeString ) )
		end
	end )
	self:addElement( GameTypeName )
	self.GameTypeName = GameTypeName
	
	local CustomGameDesc = LUI.UIText.new()
	CustomGameDesc:setLeftRight( true, false, 41.5, 464.5 )
	CustomGameDesc:setTopBottom( true, false, 352.5, 374.5 )
	CustomGameDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CustomGameDesc:setLetterSpacing( 0.5 )
	CustomGameDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CustomGameDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CustomGameDesc:linkToElementModel( self, "fileDescription", true, function ( model )
		local fileDescription = Engine.GetModelValue( model )
		if fileDescription then
			CustomGameDesc:setText( fileDescription )
		end
	end )
	self:addElement( CustomGameDesc )
	self.CustomGameDesc = CustomGameDesc
	
	local FileshareGameTypeImage = CoD.FileshareCustomGamesLocalGameTypeImage.new( menu, controller )
	FileshareGameTypeImage:setLeftRight( false, false, -214.5, 214.5 )
	FileshareGameTypeImage:setTopBottom( true, false, 13, 270.4 )
	FileshareGameTypeImage:linkToElementModel( self, "gameTypeImage", true, function ( model )
		local gameTypeImage = Engine.GetModelValue( model )
		if gameTypeImage then
			FileshareGameTypeImage.LocalGameTypeImage:setImage( RegisterImage( gameTypeImage ) )
		end
	end )
	FileshareGameTypeImage:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f8_local0
				if not FileshareShowcaseIsPublishMode( element, controller ) then
					f8_local0 = not FileshareHasContent( element, controller )
				else
					f8_local0 = false
				end
				return f8_local0
			end
		}
	} )
	FileshareGameTypeImage:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		menu:updateElementState( FileshareGameTypeImage, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	FileshareGameTypeImage:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		menu:updateElementState( FileshareGameTypeImage, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		} )
	end )
	self:addElement( FileshareGameTypeImage )
	self.FileshareGameTypeImage = FileshareGameTypeImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FileshareSelectedItemInfo:completeAnimation()
				self.FileshareSelectedItemInfo:setAlpha( 0 )
				self.clipFinished( FileshareSelectedItemInfo, {} )
				FileName:completeAnimation()
				self.FileName:setAlpha( 0 )
				self.clipFinished( FileName, {} )
				GameTypeName:completeAnimation()
				self.GameTypeName:setAlpha( 0 )
				self.clipFinished( GameTypeName, {} )
				CustomGameDesc:completeAnimation()
				self.CustomGameDesc:setAlpha( 0 )
				self.clipFinished( CustomGameDesc, {} )
				FileshareGameTypeImage:completeAnimation()
				self.FileshareGameTypeImage:setAlpha( 0 )
				self.clipFinished( FileshareGameTypeImage, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FileshareSelectedItemInfo:completeAnimation()
				self.FileshareSelectedItemInfo:setAlpha( 1 )
				self.clipFinished( FileshareSelectedItemInfo, {} )
				FileName:completeAnimation()
				self.FileName:setAlpha( 1 )
				self.clipFinished( FileName, {} )
				GameTypeName:completeAnimation()
				self.GameTypeName:setAlpha( 1 )
				self.clipFinished( GameTypeName, {} )
				CustomGameDesc:completeAnimation()
				self.CustomGameDesc:setAlpha( 1 )
				self.clipFinished( CustomGameDesc, {} )
				FileshareGameTypeImage:completeAnimation()
				self.FileshareGameTypeImage:setAlpha( 1 )
				self.clipFinished( FileshareGameTypeImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareSelectedItemInfo:close()
		element.FileName:close()
		element.GameTypeName:close()
		element.FileshareGameTypeImage:close()
		element.CustomGameDesc:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

