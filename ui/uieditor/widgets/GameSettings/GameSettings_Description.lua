-- 5bf5d6d1d35d17213a0b95061c839eee
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_Optionstextbox" )

CoD.GameSettings_Description = InheritFrom( LUI.UIElement )
CoD.GameSettings_Description.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_Description )
	self.id = "GameSettings_Description"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 489 )
	self:setTopBottom( true, false, 0, 400 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 489 )
	Background:setTopBottom( true, false, 0, 135 )
	Background:setRGB( 0.5, 0.5, 0.5 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local TitleBox = CoD.scorestreaks_TitleBox.new( menu, controller )
	TitleBox:setLeftRight( true, false, 0, 251 )
	TitleBox:setTopBottom( true, false, 0, 35 )
	TitleBox.TitleGlow1:setAlpha( 0.9 )
	TitleBox:subscribeToGlobalModel( controller, "GametypeSettings", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			TitleBox.ScorestreaksLabel:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local GameSettingsOptionstextbox = CoD.GameSettings_Optionstextbox.new( menu, controller )
	GameSettingsOptionstextbox:setLeftRight( true, false, 0, 489 )
	GameSettingsOptionstextbox:setTopBottom( true, false, 39.91, 61.91 )
	GameSettingsOptionstextbox:subscribeToGlobalModel( controller, "GametypeSettings", "description", function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			GameSettingsOptionstextbox.TextBox:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( GameSettingsOptionstextbox )
	self.GameSettingsOptionstextbox = GameSettingsOptionstextbox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setLeftRight( true, false, 0, 489 )
				self.Background:setTopBottom( true, false, 0, 135 )
				self.clipFinished( Background, {} )
			end
		},
		ExtraVeryLongText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setLeftRight( true, false, 0, 489 )
				self.Background:setTopBottom( true, false, 0, 400 )
				self.clipFinished( Background, {} )
			end
		},
		VeryLongText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setLeftRight( true, false, 0, 489 )
				self.Background:setTopBottom( true, false, 0, 300 )
				self.clipFinished( Background, {} )
			end
		},
		LongText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setLeftRight( true, false, 0, 489 )
				self.Background:setTopBottom( true, false, 0, 215 )
				self.clipFinished( Background, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ExtraVeryLongText",
			condition = function ( menu, element, event )
				return TextHeightGreaterThan( self, "Description", 275 )
			end
		},
		{
			stateName = "VeryLongText",
			condition = function ( menu, element, event )
				return TextHeightGreaterThan( self, "Description", 175 )
			end
		},
		{
			stateName = "LongText",
			condition = function ( menu, element, event )
				return TextHeightGreaterThan( self, "Description", 75 )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleBox:close()
		element.GameSettingsOptionstextbox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

