require( "ui.uieditor.widgets.GameSettings.GameSettings_Optionstextbox" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )

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
	self:setLeftRight( 0, 0, 0, 733 )
	self:setTopBottom( 0, 0, 0, 600 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 734 )
	Background:setTopBottom( 0, 0, 0, 202 )
	Background:setRGB( 0.5, 0.5, 0.5 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local TitleBox = CoD.scorestreaks_TitleBox.new( menu, controller )
	TitleBox:setLeftRight( 0, 0, 0, 376 )
	TitleBox:setTopBottom( 0, 0, 0, 52 )
	TitleBox.TitleGlow1:setAlpha( 0.9 )
	TitleBox:subscribeToGlobalModel( controller, "GametypeSettings", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleBox.ScorestreaksLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local GameSettingsOptionstextbox = CoD.GameSettings_Optionstextbox.new( menu, controller )
	GameSettingsOptionstextbox:setLeftRight( 0, 0, 0, 734 )
	GameSettingsOptionstextbox:setTopBottom( 0, 0, 60, 93 )
	GameSettingsOptionstextbox:subscribeToGlobalModel( controller, "GametypeSettings", "description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameSettingsOptionstextbox.TextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GameSettingsOptionstextbox )
	self.GameSettingsOptionstextbox = GameSettingsOptionstextbox
	
	self.resetProperties = function ()
		Background:completeAnimation()
		Background:setLeftRight( 0, 0, 0, 734 )
		Background:setTopBottom( 0, 0, 0, 202 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ExtraVeryLongText = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setLeftRight( 0, 0, 0, 734 )
				self.Background:setTopBottom( 0, 0, 0, 600 )
				self.clipFinished( Background, {} )
			end
		},
		VeryLongText = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setLeftRight( 0, 0, 0, 734 )
				self.Background:setTopBottom( 0, 0, 0, 450 )
				self.clipFinished( Background, {} )
			end
		},
		LongText = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setLeftRight( 0, 0, 0, 734 )
				self.Background:setTopBottom( 0, 0, 0, 322 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleBox:close()
		self.GameSettingsOptionstextbox:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

