-- b275192d835bc6511f41317252bd6de5
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local chooseCharacterLoadoutBumperInternal0 = CoD.chooseCharacterLoadoutBumper_Internal.new( menu, controller )
	chooseCharacterLoadoutBumperInternal0:setLeftRight( true, false, 0, 36 )
	chooseCharacterLoadoutBumperInternal0:setTopBottom( true, false, 0, 25 )
	self:addElement( chooseCharacterLoadoutBumperInternal0 )
	self.chooseCharacterLoadoutBumperInternal0 = chooseCharacterLoadoutBumperInternal0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				chooseCharacterLoadoutBumperInternal0:completeAnimation()
				self.chooseCharacterLoadoutBumperInternal0:setAlpha( 1 )
				self.clipFinished( chooseCharacterLoadoutBumperInternal0, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				chooseCharacterLoadoutBumperInternal0:completeAnimation()
				self.chooseCharacterLoadoutBumperInternal0:setAlpha( 0 )
				self.clipFinished( chooseCharacterLoadoutBumperInternal0, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.chooseCharacterLoadoutBumperInternal0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

