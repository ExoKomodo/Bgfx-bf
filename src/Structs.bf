using System;

namespace Bgfx
{
	[CRepr]
	public struct Caps
	{
		[CRepr]
	    public struct GPU
	    {
	        public uint16 vendorId;
	        public uint16 deviceId;
	    }

		[CRepr]
	    public struct Limits
	    {
	        public uint32 maxDrawCalls;
	        public uint32 maxBlits;
	        public uint32 maxTextureSize;
	        public uint32 maxTextureLayers;
	        public uint32 maxViews;
	        public uint32 maxFrameBuffers;
	        public uint32 maxFBAttachments;
	        public uint32 maxPrograms;
	        public uint32 maxShaders;
	        public uint32 maxTextures;
	        public uint32 maxTextureSamplers;
	        public uint32 maxComputeBindings;
	        public uint32 maxVertexLayouts;
	        public uint32 maxVertexStreams;
	        public uint32 maxIndexBuffers;
	        public uint32 maxVertexBuffers;
	        public uint32 maxDynamicIndexBuffers;
	        public uint32 maxDynamicVertexBuffers;
	        public uint32 maxUniforms;
	        public uint32 maxOcclusionQueries;
	        public uint32 maxEncoders;
	        public uint32 minResourceCbSize;
	        public uint32 transientVbSize;
	        public uint32 transientIbSize;
	    }

	    public RendererType rendererType;
	    public uint64 supported;
	    public uint16 vendorId;
	    public uint16 deviceId;
	    public byte homogeneousDepth;
	    public byte originBottomLeft;
	    public byte numGPUs;
	    public uint32[4] gpu;
	    public Limits limits;
	    public uint16[85] formats;
	}

	[CRepr]
	public struct InternalData
	{
	    public Caps* capabilities;
	    public void* context;
	}

	[CRepr]
	public struct PlatformData
	{
	    public void* ndt;
	    public Windows.HWnd nwh;
	    public void* context;
	    public void* backBuffer;
	    public void* backBufferDS;
	}

	[CRepr]
	public struct Resolution
	{
	    public TextureFormat format;
	    public uint32 width;
	    public uint32 height;
	    public ResetFlags reset;
	    public byte numBackBuffers;
	    public byte maxFrameLatency;
	}

	[CRepr]
	public struct InitInfo
	{
		[CRepr]
	    public struct Limits
	    {
	        public uint16 maxEncoders;
	        public uint32 minResourceCbSize;
	        public uint32 transientVbSize;
	        public uint32 transientIbSize;
	    }

	    public RendererType type;
	    public uint16 vendorId;
	    public uint16 deviceId;
	    public byte debug;
	    public byte profile;
	    public PlatformData platformData;
	    public Resolution resolution;
	    public Limits limits;
	    public void* callback;
	    public void* allocator;
	}

	[CRepr]
	public struct Memory
	{
	    public byte* data;
	    public uint32 size;
	}

	[CRepr]
	public struct TransientIndexBuffer
	{
	    public byte* data;
	    public uint32 size;
	    public uint32 startIndex;
	    public IndexBufferHandle handle;
	}

	[CRepr]
	public struct TransientVertexBuffer
	{
	    public byte* data;
	    public uint32 size;
	    public uint32 startVertex;
	    public uint16 stride;
	    public VertexBufferHandle handle;
	    public VertexLayoutHandle layoutHandle;
	}

	[CRepr]
	public struct InstanceDataBuffer
	{
	    public byte* data;
	    public uint32 size;
	    public uint32 offset;
	    public uint32 num;
	    public uint16 stride;
	    public VertexBufferHandle handle;
	}

	[CRepr]
	public struct TextureInfo
	{
	    public TextureFormat format;
	    public uint32 storageSize;
	    public uint16 width;
	    public uint16 height;
	    public uint16 depth;
	    public uint16 numLayers;
	    public byte numMips;
	    public byte bitsPerPixel;
	    public byte cubeMap;
	}

	[CRepr]
	public struct UniformInfo
	{
	    public byte[256] name;
	    public UniformType type;
	    public uint16 num;
	}

	[CRepr]
	public struct Attachment
	{
	    public Access access;
	    public TextureHandle handle;
	    public uint16 mip;
	    public uint16 layer;
	    public byte resolve;
	}

	[CRepr]
	public struct Transform
	{
	    public float* data;
	    public uint16 num;
	}

	[CRepr]
	public struct ViewStats
	{
	    public byte[256] name;
	    public uint16 view;
	    public int64 cpuTimeBegin;
	    public int64 cpuTimeEnd;
	    public int64 gpuTimeBegin;
	    public int64 gpuTimeEnd;
	}

	[CRepr]
	public struct EncoderStats
	{
	    public int64 cpuTimeBegin;
	    public int64 cpuTimeEnd;
	}

	[CRepr]
	public struct Stats
	{
	    public int64 cpuTimeFrame;
	    public int64 cpuTimeBegin;
	    public int64 cpuTimeEnd;
	    public int64 cpuTimerFreq;
	    public int64 gpuTimeBegin;
	    public int64 gpuTimeEnd;
	    public int64 gpuTimerFreq;
	    public int64 waitRender;
	    public int64 waitSubmit;
	    public uint32 numDraw;
	    public uint32 numCompute;
	    public uint32 numBlit;
	    public uint32 maxGpuLatency;
	    public uint16 numDynamicIndexBuffers;
	    public uint16 numDynamicVertexBuffers;
	    public uint16 numFrameBuffers;
	    public uint16 numIndexBuffers;
	    public uint16 numOcclusionQueries;
	    public uint16 numPrograms;
	    public uint16 numShaders;
	    public uint16 numTextures;
	    public uint16 numUniforms;
	    public uint16 numVertexBuffers;
	    public uint16 numVertexLayouts;
	    public int64 textureMemoryUsed;
	    public int64 rtMemoryUsed;
	    public int32 transientVbUsed;
	    public int32 transientIbUsed;
	    public uint32[5] numPrims;
	    public int64 gpuMemoryMax;
	    public int64 gpuMemoryUsed;
	    public uint16 width;
	    public uint16 height;
	    public uint16 textWidth;
	    public uint16 textHeight;
	    public uint16 numViews;
	    public ViewStats* viewStats;
	    public byte numEncoders;
	    public EncoderStats* encoderStats;
	}

	[CRepr]
	public struct VertexLayout
	{
	    public uint32 hash;
	    public uint16 stride;
	    public uint16[18] offset;
	    public uint16[18] attributes;
	}

	[CRepr]
	public struct Encoder
	{
	}

	[CRepr]
	public struct DynamicIndexBufferHandle {
	    public uint16 idx;
	    public bool Valid => idx != UInt16.MaxValue;
	}

	[CRepr]
	public struct DynamicVertexBufferHandle {
	    public uint16 idx;
	    public bool Valid => idx != UInt16.MaxValue;
	}

	[CRepr]
	public struct FrameBufferHandle {
	    public uint16 idx;
	    public bool Valid => idx != UInt16.MaxValue;
	}

	[CRepr]
	public struct IndexBufferHandle {
	    public uint16 idx;
	    public bool Valid => idx != UInt16.MaxValue;
	}

	[CRepr]
	public struct IndirectBufferHandle {
	    public uint16 idx;
	    public bool Valid => idx != UInt16.MaxValue;
	}

	[CRepr]
	public struct OcclusionQueryHandle {
	    public uint16 idx;
	    public bool Valid => idx != UInt16.MaxValue;
	}

	[CRepr]
	public struct ProgramHandle {
	    public uint16 idx;
	    public bool Valid => idx != UInt16.MaxValue;
	}

	[CRepr]
	public struct ShaderHandle {
	    public uint16 idx;
	    public bool Valid => idx != UInt16.MaxValue;
	}

	[CRepr]
	public struct TextureHandle {
	    public uint16 idx;
	    public bool Valid => idx != UInt16.MaxValue;
	}

	[CRepr]
	public struct UniformHandle {
	    public uint16 idx;
	    public bool Valid => idx != UInt16.MaxValue;
	}

	[CRepr]
	public struct VertexBufferHandle {
	    public uint16 idx;
	    public bool Valid => idx != UInt16.MaxValue;
	}

	[CRepr]
	public struct VertexLayoutHandle {
	    public uint16 idx;
	    public bool Valid => idx != UInt16.MaxValue;
	}
}
