-- f522b8f0d23836c287438b924c943759
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.Medals.Notification_Medals_Backing_9Slice" )

CoD.Notification_Medals_Label = InheritFrom( LUI.UIElement )
CoD.Notification_Medals_Label.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notification_Medals_Label )
	self.id = "Notification_Medals_Label"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 201 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local NotificationMedalsBacking9Slice = CoD.Notification_Medals_Backing_9Slice.new( menu, controller )
	NotificationMedalsBacking9Slice:setLeftRight( true, true, 0, 0 )
	NotificationMedalsBacking9Slice:setTopBottom( true, false, 0, 36 )
	NotificationMedalsBacking9Slice:setAlpha( 0 )
	NotificationMedalsBacking9Slice:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( NotificationMedalsBacking9Slice )
	self.NotificationMedalsBacking9Slice = NotificationMedalsBacking9Slice
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( false, false, -100.5, 99.5 )
	TextBox0:setTopBottom( true, false, 9.5, 34.5 )
	TextBox0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( TextBox0, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 40, 40 )
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.TextBox0:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			TextBox0:setText( Engine.Localize( title ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 0 )
			end,
			Combined = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NotificationMedalsBacking9Slice:close()
		element.TextBox0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

