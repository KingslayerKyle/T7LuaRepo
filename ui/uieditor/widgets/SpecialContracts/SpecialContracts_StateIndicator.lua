-- 1684b6fdbb401f27c00c82f4bdd20810
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_CryptokeyCounterIcon" )

CoD.SpecialContracts_StateIndicator = InheritFrom( LUI.UIElement )
CoD.SpecialContracts_StateIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialContracts_StateIndicator )
	self.id = "SpecialContracts_StateIndicator"
	self.soundSet = "Blackmarket_extra"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local CryptokeyIcon0 = CoD.BM_CryptokeyCounterIcon.new( menu, controller )
	CryptokeyIcon0:setLeftRight( false, false, -42, -14 )
	CryptokeyIcon0:setTopBottom( false, true, -25, 3 )
	self:addElement( CryptokeyIcon0 )
	self.CryptokeyIcon0 = CryptokeyIcon0
	
	local ContractDesc0 = LUI.UIText.new()
	ContractDesc0:setLeftRight( false, false, -13, 33 )
	ContractDesc0:setTopBottom( false, true, -20, 0 )
	ContractDesc0:setRGB( 0.46, 0.8, 0.75 )
	ContractDesc0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ContractDesc0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ContractDesc0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ContractDesc0 )
	self.ContractDesc0 = ContractDesc0
	
	self.ContractDesc0:linkToElementModel( self, "cost", true, function ( model )
		local cost = Engine.GetModelValue( model )
		if cost then
			ContractDesc0:setText( Engine.Localize( cost ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CryptokeyIcon0:completeAnimation()
				self.CryptokeyIcon0:setAlpha( 0 )
				self.clipFinished( CryptokeyIcon0, {} )
				ContractDesc0:completeAnimation()
				self.ContractDesc0:setAlpha( 0 )
				self.clipFinished( ContractDesc0, {} )
			end
		},
		Cost = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CryptokeyIcon0:completeAnimation()
				self.CryptokeyIcon0:setAlpha( 1 )
				self.clipFinished( CryptokeyIcon0, {} )
				ContractDesc0:completeAnimation()
				self.ContractDesc0:setAlpha( 1 )
				self.clipFinished( ContractDesc0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CryptokeyIcon0:close()
		element.ContractDesc0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

