-- 224d27edb7242d3759e9ac038d3e08a8
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_HashTextInternal = InheritFrom( LUI.UIElement )
CoD.VehicleGround_HashTextInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_HashTextInternal )
	self.id = "VehicleGround_HashTextInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 42 )
	self:setTopBottom( true, false, 0, 316 )
	
	local TextNumbers = LUI.UIText.new()
	TextNumbers:setLeftRight( false, false, -21, 21 )
	TextNumbers:setTopBottom( false, false, -8, 8 )
	TextNumbers:setRGB( 0.47, 0.51, 0.6 )
	TextNumbers:setText( Engine.Localize( "550" ) )
	TextNumbers:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextNumbers:setLetterSpacing( 1.5 )
	TextNumbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextNumbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextNumbers )
	self.TextNumbers = TextNumbers
	
	local TextNumbers1 = LUI.UIText.new()
	TextNumbers1:setLeftRight( false, false, -21, 21 )
	TextNumbers1:setTopBottom( false, false, 17, 33 )
	TextNumbers1:setRGB( 0.47, 0.51, 0.6 )
	TextNumbers1:setText( Engine.Localize( "525" ) )
	TextNumbers1:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextNumbers1:setLetterSpacing( 1.5 )
	TextNumbers1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextNumbers1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextNumbers1 )
	self.TextNumbers1 = TextNumbers1
	
	local TextNumbers0 = LUI.UIText.new()
	TextNumbers0:setLeftRight( false, false, -21, 21 )
	TextNumbers0:setTopBottom( false, false, -33, -17 )
	TextNumbers0:setRGB( 0.47, 0.51, 0.6 )
	TextNumbers0:setText( Engine.Localize( "575" ) )
	TextNumbers0:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextNumbers0:setLetterSpacing( 1.5 )
	TextNumbers0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextNumbers0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextNumbers0 )
	self.TextNumbers0 = TextNumbers0
	
	local TextNumbers00 = LUI.UIText.new()
	TextNumbers00:setLeftRight( false, false, -21, 21 )
	TextNumbers00:setTopBottom( false, false, -58, -42 )
	TextNumbers00:setRGB( 0.47, 0.51, 0.6 )
	TextNumbers00:setText( Engine.Localize( "600" ) )
	TextNumbers00:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextNumbers00:setLetterSpacing( 1.5 )
	TextNumbers00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextNumbers00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextNumbers00 )
	self.TextNumbers00 = TextNumbers00
	
	local TextNumbers000 = LUI.UIText.new()
	TextNumbers000:setLeftRight( false, false, -21, 21 )
	TextNumbers000:setTopBottom( false, false, -83, -67 )
	TextNumbers000:setRGB( 0.47, 0.51, 0.6 )
	TextNumbers000:setText( Engine.Localize( "625" ) )
	TextNumbers000:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextNumbers000:setLetterSpacing( 1.5 )
	TextNumbers000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextNumbers000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextNumbers000 )
	self.TextNumbers000 = TextNumbers000
	
	local TextNumbers10 = LUI.UIText.new()
	TextNumbers10:setLeftRight( false, false, -21, 21 )
	TextNumbers10:setTopBottom( false, false, 42, 58 )
	TextNumbers10:setRGB( 0.47, 0.51, 0.6 )
	TextNumbers10:setText( Engine.Localize( "500" ) )
	TextNumbers10:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextNumbers10:setLetterSpacing( 1.5 )
	TextNumbers10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextNumbers10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextNumbers10 )
	self.TextNumbers10 = TextNumbers10
	
	local TextNumbers100 = LUI.UIText.new()
	TextNumbers100:setLeftRight( false, false, -21, 21 )
	TextNumbers100:setTopBottom( false, false, 67, 83 )
	TextNumbers100:setRGB( 0.47, 0.51, 0.6 )
	TextNumbers100:setText( Engine.Localize( "475" ) )
	TextNumbers100:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextNumbers100:setLetterSpacing( 1.5 )
	TextNumbers100:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextNumbers100:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextNumbers100 )
	self.TextNumbers100 = TextNumbers100
	
	local TextNumbers1000 = LUI.UIText.new()
	TextNumbers1000:setLeftRight( false, false, -21, 21 )
	TextNumbers1000:setTopBottom( false, false, 92, 108 )
	TextNumbers1000:setRGB( 0.47, 0.51, 0.6 )
	TextNumbers1000:setText( Engine.Localize( "450" ) )
	TextNumbers1000:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextNumbers1000:setLetterSpacing( 1.5 )
	TextNumbers1000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextNumbers1000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextNumbers1000 )
	self.TextNumbers1000 = TextNumbers1000
	
	local TextNumbers10000 = LUI.UIText.new()
	TextNumbers10000:setLeftRight( false, false, -21, 21 )
	TextNumbers10000:setTopBottom( false, false, 117, 133 )
	TextNumbers10000:setRGB( 0.47, 0.51, 0.6 )
	TextNumbers10000:setText( Engine.Localize( "425" ) )
	TextNumbers10000:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextNumbers10000:setLetterSpacing( 1.5 )
	TextNumbers10000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextNumbers10000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextNumbers10000 )
	self.TextNumbers10000 = TextNumbers10000
	
	local TextNumbers100000 = LUI.UIText.new()
	TextNumbers100000:setLeftRight( false, false, -21, 21 )
	TextNumbers100000:setTopBottom( false, false, 142, 158 )
	TextNumbers100000:setRGB( 0.47, 0.51, 0.6 )
	TextNumbers100000:setText( Engine.Localize( "400 " ) )
	TextNumbers100000:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextNumbers100000:setLetterSpacing( 1.5 )
	TextNumbers100000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextNumbers100000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextNumbers100000 )
	self.TextNumbers100000 = TextNumbers100000
	
	local TextNumbers0000 = LUI.UIText.new()
	TextNumbers0000:setLeftRight( false, false, -21, 21 )
	TextNumbers0000:setTopBottom( false, false, -108, -92 )
	TextNumbers0000:setRGB( 0.47, 0.51, 0.6 )
	TextNumbers0000:setText( Engine.Localize( "650" ) )
	TextNumbers0000:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextNumbers0000:setLetterSpacing( 1.5 )
	TextNumbers0000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextNumbers0000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextNumbers0000 )
	self.TextNumbers0000 = TextNumbers0000
	
	local TextNumbers00000 = LUI.UIText.new()
	TextNumbers00000:setLeftRight( false, false, -21, 21 )
	TextNumbers00000:setTopBottom( false, false, -133, -117 )
	TextNumbers00000:setRGB( 0.47, 0.51, 0.6 )
	TextNumbers00000:setText( Engine.Localize( "675" ) )
	TextNumbers00000:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextNumbers00000:setLetterSpacing( 1.5 )
	TextNumbers00000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextNumbers00000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextNumbers00000 )
	self.TextNumbers00000 = TextNumbers00000
	
	local TextNumbers000000 = LUI.UIText.new()
	TextNumbers000000:setLeftRight( false, false, -21, 21 )
	TextNumbers000000:setTopBottom( false, false, -158, -142 )
	TextNumbers000000:setRGB( 0.47, 0.51, 0.6 )
	TextNumbers000000:setText( Engine.Localize( "700 " ) )
	TextNumbers000000:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextNumbers000000:setLetterSpacing( 1.5 )
	TextNumbers000000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextNumbers000000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextNumbers000000 )
	self.TextNumbers000000 = TextNumbers000000
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

