require( "ui.uieditor.widgets.CharacterCustomization.chooseCharacterLoadoutBumper_Internal" )

CoD.chooseCharacterLoadoutBumper = InheritFrom( LUI.UIElement )
CoD.chooseCharacterLoadoutBumper.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.chooseCharacterLoadoutBumper )
	self.id = "chooseCharacterLoadoutBumper"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 54 )
	self:setTopBottom( 0, 0, 0, 37 )
	self.anyChildUsesUpdateState = true
	
	local chooseCharacterLoadoutBumperInternal0 = CoD.chooseCharacterLoadoutBumper_Internal.new( menu, controller )
	chooseCharacterLoadoutBumperInternal0:setLeftRight( 0, 0, 0, 54 )
	chooseCharacterLoadoutBumperInternal0:setTopBottom( 0, 0, 0, 38 )
	self:addElement( chooseCharacterLoadoutBumperInternal0 )
	self.chooseCharacterLoadoutBumperInternal0 = chooseCharacterLoadoutBumperInternal0
	
	self.resetProperties = function ()
		chooseCharacterLoadoutBumperInternal0:completeAnimation()
		chooseCharacterLoadoutBumperInternal0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Active = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				chooseCharacterLoadoutBumperInternal0:completeAnimation()
				self.chooseCharacterLoadoutBumperInternal0:setAlpha( 0 )
				self.clipFinished( chooseCharacterLoadoutBumperInternal0, {} )
			end,
			Active = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.chooseCharacterLoadoutBumperInternal0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

