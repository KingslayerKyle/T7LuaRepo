require( "ui.uieditor.widgets.horizontalScrollingTextBox_20pt" )

CoD.Social_PlayersListButton_Presence = InheritFrom( LUI.UIElement )
CoD.Social_PlayersListButton_Presence.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_PlayersListButton_Presence )
	self.id = "Social_PlayersListButton_Presence"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 258 )
	self:setTopBottom( true, false, 0, 24 )
	
	local platformPresenceScroller = CoD.horizontalScrollingTextBox_20pt.new( menu, controller )
	platformPresenceScroller:setLeftRight( true, false, 3, 257 )
	platformPresenceScroller:setTopBottom( true, false, 2, 22 )
	platformPresenceScroller:setAlpha( 0 )
	platformPresenceScroller.textBox:setText( Engine.Localize( "" ) )
	platformPresenceScroller.textBox:setTTF( "fonts/default.ttf" )
	platformPresenceScroller.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( platformPresenceScroller )
	self.platformPresenceScroller = platformPresenceScroller
	
	local titlePresenceScroller = CoD.horizontalScrollingTextBox_20pt.new( menu, controller )
	titlePresenceScroller:setLeftRight( true, false, 20, 148 )
	titlePresenceScroller:setTopBottom( true, false, 2, 22 )
	titlePresenceScroller.textBox:setText( Engine.Localize( "" ) )
	titlePresenceScroller.textBox:setTTF( "fonts/default.ttf" )
	titlePresenceScroller.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( titlePresenceScroller )
	self.titlePresenceScroller = titlePresenceScroller
	
	local titlePresenceIcon = LUI.UIImage.new()
	titlePresenceIcon:setLeftRight( true, false, -5, 19 )
	titlePresenceIcon:setTopBottom( true, false, 0, 24 )
	titlePresenceIcon:setImage( RegisterImage( "uie_t7_menu_frontend_iconmodebo3" ) )
	self:addElement( titlePresenceIcon )
	self.titlePresenceIcon = titlePresenceIcon
	
	local lastMet = LUI.UITightText.new()
	lastMet:setLeftRight( false, true, -136, -6 )
	lastMet:setTopBottom( true, false, 5, 21 )
	lastMet:setAlpha( HideIfEmptyString( 1 ) )
	lastMet:setText( Engine.Localize( "" ) )
	lastMet:setTTF( "fonts/default.ttf" )
	self:addElement( lastMet )
	self.lastMet = lastMet
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				platformPresenceScroller:completeAnimation()
				self.platformPresenceScroller:setAlpha( 0 )
				self.clipFinished( platformPresenceScroller, {} )
				titlePresenceScroller:completeAnimation()
				self.titlePresenceScroller:setAlpha( 1 )
				self.clipFinished( titlePresenceScroller, {} )
				titlePresenceIcon:completeAnimation()
				self.titlePresenceIcon:setAlpha( 1 )
				self.clipFinished( titlePresenceIcon, {} )
			end
		},
		ShowPlatformPresence = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				platformPresenceScroller:completeAnimation()
				self.platformPresenceScroller:setAlpha( 1 )
				self.clipFinished( platformPresenceScroller, {} )
				titlePresenceScroller:completeAnimation()
				self.titlePresenceScroller:setAlpha( 0 )
				self.clipFinished( titlePresenceScroller, {} )
				titlePresenceIcon:completeAnimation()
				self.titlePresenceIcon:setAlpha( 0 )
				self.clipFinished( titlePresenceIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowPlatformPresence",
			condition = function ( menu, element, event )
				return not IsInTitle( self, controller )
			end
		}
	} )
	self:linkToElementModel( self, "activity", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "activity"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.platformPresenceScroller:close()
		element.titlePresenceScroller:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

