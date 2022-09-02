-- 81ead46b3d3dd4c6a948b4083016d3c0
-- This hash is used for caching, delete to decompile the file again

CoD.SpikeLauncherData = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherData.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SpikeLauncherData )
	self.id = "SpikeLauncherData"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 79 )
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 42.67, 120.06 )
	TextBox0:setTopBottom( true, false, 0, 5 )
	TextBox0:setText( Engine.Localize( "FRACTURE_FAULT" ) )
	TextBox0:setTTF( "fonts/UnitedSansRgMd.ttf" )
	TextBox0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextBox0:setShaderVector( 0, 0.02, 0.5, 0, 0 )
	TextBox0:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 11, 55.39 )
	TextBox1:setTopBottom( true, false, 24, 29 )
	TextBox1:setText( Engine.Localize( "// PingingStructure...          // Crack.12.AB" ) )
	TextBox1:setTTF( "fonts/default.ttf" )
	TextBox1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextBox1:setShaderVector( 0, 0.02, 0.5, 0, 0 )
	TextBox1:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 0, 41.39 )
	TextBox2:setTopBottom( true, false, 41, 46 )
	TextBox2:setText( Engine.Localize( "// StructureMapping...   // 243.12m_33.01m      // .." ) )
	TextBox2:setTTF( "fonts/default.ttf" )
	TextBox2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextBox2:setShaderVector( 0, 0.02, 0.5, 0, 0 )
	TextBox2:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local TextBox3 = LUI.UIText.new()
	TextBox3:setLeftRight( true, false, 0, 41.39 )
	TextBox3:setTopBottom( true, false, 63, 68 )
	TextBox3:setText( Engine.Localize( "// .." ) )
	TextBox3:setTTF( "fonts/default.ttf" )
	TextBox3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextBox3:setShaderVector( 0, 0.02, 0.5, 0, 0 )
	TextBox3:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox3:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox3:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox3:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3 )
	self.TextBox3 = TextBox3
	
	local TextBox4 = LUI.UIText.new()
	TextBox4:setLeftRight( true, false, 0, 41.39 )
	TextBox4:setTopBottom( true, false, 74, 79 )
	TextBox4:setText( Engine.Localize( "//                                       //" ) )
	TextBox4:setTTF( "fonts/default.ttf" )
	TextBox4:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextBox4:setShaderVector( 0, 0.02, 0.5, 0, 0 )
	TextBox4:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox4:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox4:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox4:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox4 )
	self.TextBox4 = TextBox4
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

