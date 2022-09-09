-- 497d56d47ab148c7dbd62f6122c0356e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.FileshareCustomGamesLocalGameTypeImage" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

CoD.MyShowcase_CustomGameListInfo = InheritFrom( LUI.UIElement )
CoD.MyShowcase_CustomGameListInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MyShowcase_CustomGameListInfo )
	self.id = "MyShowcase_CustomGameListInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 400 )
	self.anyChildUsesUpdateState = true
	
	local FileshareGameTypeImage = CoD.FileshareCustomGamesLocalGameTypeImage.new( menu, controller )
	FileshareGameTypeImage:setLeftRight( false, false, -214.5, 214.5 )
	FileshareGameTypeImage:setTopBottom( true, false, 13, 270.4 )
	FileshareGameTypeImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			FileshareGameTypeImage.LocalGameTypeImage:setImage( RegisterImage( image ) )
		end
	end )
	FileshareGameTypeImage:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( FileshareGameTypeImage )
	self.FileshareGameTypeImage = FileshareGameTypeImage
	
	local FileName = CoD.WeaponNameWidget.new( menu, controller )
	FileName:setLeftRight( true, false, 38, 461 )
	FileName:setTopBottom( true, false, 285, 319 )
	FileName:linkToElementModel( self, nil, false, function ( model )
		FileName:setModel( model, controller )
	end )
	FileName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			FileName.weaponNameLabel:setText( name )
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
	CustomGameDesc:linkToElementModel( self, "gameDescription", true, function ( model )
		local gameDescription = Engine.GetModelValue( model )
		if gameDescription then
			CustomGameDesc:setText( gameDescription )
		end
	end )
	self:addElement( CustomGameDesc )
	self.CustomGameDesc = CustomGameDesc
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				FileshareGameTypeImage:completeAnimation()
				self.FileshareGameTypeImage:setAlpha( 0 )
				self.clipFinished( FileshareGameTypeImage, {} )

				FileName:completeAnimation()
				self.FileName:setAlpha( 0 )
				self.clipFinished( FileName, {} )

				GameTypeName:completeAnimation()
				self.GameTypeName:setAlpha( 0 )
				self.clipFinished( GameTypeName, {} )

				CustomGameDesc:completeAnimation()
				self.CustomGameDesc:setAlpha( 0 )
				self.clipFinished( CustomGameDesc, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				FileshareGameTypeImage:completeAnimation()
				self.FileshareGameTypeImage:setAlpha( 1 )
				self.clipFinished( FileshareGameTypeImage, {} )

				FileName:completeAnimation()
				self.FileName:setAlpha( 1 )
				self.clipFinished( FileName, {} )

				GameTypeName:completeAnimation()
				self.GameTypeName:setAlpha( 1 )
				self.clipFinished( GameTypeName, {} )

				CustomGameDesc:completeAnimation()
				self.CustomGameDesc:setAlpha( 1 )
				self.clipFinished( CustomGameDesc, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareGameTypeImage:close()
		element.FileName:close()
		element.GameTypeName:close()
		element.CustomGameDesc:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
